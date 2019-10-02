#! /bin/bash 

# Retrive the last pushed commit from the repo
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
last_commit_hash=`git merge-base $branch HEAD`
echo "Last commit hash: $last_commit_hash"

# This function is used to parse the yaml file.
function yaml_parser() {
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

# This function checks whether the kind is CSV or CE
checker(){
    if [[ $1 == "ChaosExperiment" ]]; then
        echo $metadata_version
    elif [[ $1 == "ChartServiceVersion" ]]; then
        echo $spec_version 
    fi
}

# This function takes the old version from the last commit 
# and increment the existing version by one unit.
versionInc(){
    echo "version inc"
    file=$1
    
    eval $(yaml_parser $file)
    if [[ $? == 0 ]]; then
        existing_version=`checker $kind`
        echo "Existing version: $existing_version"

        # stores the last pushed committed file as temp.yaml in the root directory 
        # and will be deleted after the job
        temp_file=`git show $last_commit_hash:$1 >> temp.yaml`

        eval $(yaml_parser './temp.yaml')
        if [[ $? == 0 ]]; then

            oldversion=`checker $kind`
            echo "Oldversion : $oldversion"

            # storing version to an array 
            versions=( ${oldversion//./ } )
            ((versions[2]++)) # Increment the patch version by one unit
            newversion="${versions[0]}.${versions[1]}.${versions[2]}"

            # This python script checks and validate the version
            sudo python3 scripts/validate_version.py $oldversion $newversion
        
            if [[ $? == 0 ]]; then
                `sed -i "s/$existing_version/$newversion/" $file` &&
                echo "$file's version updated from $oldversion to $newversion"
            fi
        fi
        # deleting the temporary file 
        rm './temp.yaml'
    fi
}

# This function takes the latest from the base-template'
# and increment the existing version in the csv/experiment file
# by the input version mention in the basetemplate by the user.
versionMod(){

    file=$1
    echo $file
    eval $(yaml_parser $file)

    if [[ $? == 0 ]]; then
    
        # check if kind is chaosexperiment or ChartServiceVersion
        newversion=`checker $kind`
        echo "New Version: $newversion"

        temp=$(echo ${file::-18}) # This statement will scrap last 18 character which will be .basetemplate.yaml
        if [[ $kind == "ChartServiceVersion" ]]; then
            oldversionfile=$temp'.yaml'
            echo $oldversionfile
            eval $(yaml_parser $oldversionfile)

            if [[ $? == 0 ]]; then
                oldversion=$spec_version
                # This python script checks and validate the version
                sudo python3 scripts/validate_version.py $oldversion $newversion

                if [[ $? == 0 ]]; then
                    `sed -i "s/$oldversion/$newversion/" $oldversionfile` &&
                    `sed -i "s/version:[[:space:]]*$newversion/version: {{ VERSION }}/" $file`
                    echo "$file's version updated from $oldversion to $newversion"
                fi
            fi
        elif [ $kind == "ChaosExperiment" ]; then

            oldversionfile=$temp'.yaml'
            echo $oldversionfile
            eval $(yaml_parser $oldversionfile)

            if [[ $? == 0 ]]; then
                oldversion=$metadata_version

                # This python script checks and validate the version
                sudo python3 scripts/validate_version.py $oldversion $newversion

                if [[ $? == 0 ]]; then
                    `sed -i "s/$oldversion/$newversion/" $oldversionfile` &&
                    `sed -i "s/version:[[:space:]]*$newversion/version: {{ VERSION }}/" $file`
                    echo "$file's version updated from $oldversion to $newversion"
                fi
            fi
        fi
    fi
}

# compare and retrive the changed files
check_diff=`git diff ${last_commit_hash} --name-only`
files=$(echo $check_diff | tr " " "\n")

for file in $files
do
    # For basetemplate (Experiment and chart service version)
    if [[ "$file" =~ \basetemplate.yaml$ ]]; then
        versionMod $file
        break;
    # For chart service version
    elif [[ "$file" =~ \version.yaml$ ]]; then
        versionInc $file
        break;

    # # For experiment
    elif [[ "$file" =~ \experiment.yaml$ ]]; then
        versionInc $file
    fi
done