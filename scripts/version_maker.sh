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
FIND_CMD=`find ../charts -type f -name "*basetemplate.yaml"`

# add all the files to an array called files
files=$(echo $FIND_CMD | tr " " "\n")

# looping from all the files
for file in $files
do
    # get the latest version from the template file
    
    eval $(yaml $file)
    kind=$kind

    if [ $kind == "ChaosExperiment" ]; then
        version=$metadata_version
    elif [ $kind == "ChartServiceVersion" ]; then
        version=$spec_version 
    fi

    echo $version
    SEMVER_REGEX="^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$"
    echo $file
    # if version is interger or float (semversion)
    result=sudo python ./semversion_checker.py $version
    if [ $? == 0 ]; then
        if [ $kind == "ChartServiceVersion" ]; then
            temp=$(echo ${file::-18})
            echo $temp  
            # `truncate -s 0 $temp.yaml && cp $file $temp.yaml`
            # `sed -i "s/version:[[:space:]]*$version/version:  {{ VERSION }}/" $file`
        
        fi
    #     # removing old version file
    #     oldversion=`rm ${temp}.yaml`

    # # # it will make a new csv with new version number and
    # # # and rename the the version number in the base templatewith the default syntax {{ VERSION }}
        # `touch $temp.yaml && cp $file $temp.yaml`
    fi
    
done


