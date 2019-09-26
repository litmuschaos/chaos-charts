#! /bin/bash 

# parsing yaml file
function yaml() {
    local prefix=$2
    local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
    sed -ne "s|^\($s\):|\1|" \
            -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
            -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
    awk -F$fs '{
        indent = length($1)/2;
        vname[indent] = $2;
        for (i in vname) {if (i > indent) {delete vname[i]}}
        if (length($3) > 0) {
            vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
            printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
        }
    }'
}

# find files ended with chartserviceversion.yaml 
FIND_CMD=`find ./charts -type f -name "*basetemplate.yaml"`

# add all the files to an array called files
files=$(echo $FIND_CMD | tr " " "\n")

# looping from all the files
for file in $files
do
    # get the latest version from the template file
    eval $(yaml $file)

    if [[ $? == 0 ]]; then
    
        kind=$kind
        # check if kind is chaosexperiment or ChartServiceVersion
        if [[ $kind == "ChaosExperiment" ]]; then
            newversion=$metadata_version
        elif [[ $kind == "ChartServiceVersion" ]]; then
            newversion=$spec_version 
        fi

        echo $newversion
        # if  version is interger or float (semversion)
        sudo python scripts/validate_version.py $newversion

        if [[ $? == 0 ]]; then
                temp=$(echo ${file::-18})
            if [[ $kind == "ChartServiceVersion" ]]; then
                # echo $temp
                oldversionfile=$temp'.yaml'
                echo $oldversionfile
                eval $(yaml $oldversionfile)

                echo $?
                if [[ $? == 0 ]]; then
                    oldversion=$spec_version
                    echo $oldversion

                    `sed -i  "s/$oldversion/$newversion/" $oldversionfile` &&
                    `sed -i  "s/version:[[:space:]]*$newversion/version:  {{ VERSION }}/" $file`
                fi

            elif [ $kind == "ChaosExperiment" ]; then
                # echo $temp
                oldversionfile=$temp'.version.yaml'
                echo $oldversionfile
                eval $(yaml $oldversionfile)

                if [[ $? == 0 ]]; then
                    oldversion=$metadata_version
                    echo $oldversion

                    `sed -i  "s/$oldversion/$newversion/" $oldversionfile`
                    `sed -i "s/version:[[:space:]]*$newversion/version:  {{ VERSION }}/" $file`
                fi
            fi
        fi
    fi
done