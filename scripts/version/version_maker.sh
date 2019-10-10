#! /bin/sh

# Retrive the last pushed commit from the repo
second_last_commit_hash=`git log -n 2 --pretty=format:"%H" | tail -1`
echo "Second Last commit hash: $second_last_commit_hash"

# # This function is used to parse the yaml file.
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

# This function takes the old version from the last commit 
# and increments the existing version by one unit.
versionInc(){
    echo "version inc"
    file=$1

    eval $(yaml_parser $file)
    if [[ $? == 0 ]]
    then
        existing_version=$metadata_version
        echo "Existing version: $existing_version"

        # stores the last pushed committed file as temp.yaml in the root directory 
        # and will be deleted after the job
        temp_file=`git show $second_last_commit_hash:$1 >> temp.yaml`

        eval $(yaml_parser './temp.yaml')
        if [[ $? == 0 ]]
        then
            oldversion=$metadata_version
            echo "Oldversion : $oldversion"
            sudo python3 scripts/version/version_validator.py $existing_version $oldversion
            ret_code=$?

            if [[ $ret_code == 0 ]]; then
                echo "$file's version updated from $oldversion to $existing_version"
                elif [[ $ret_code == 2 ]]; then
                    # storing version to an array 
                    versions=( ${oldversion//./ } )
                    ((versions[2]++)) # Increment the patch version by one unit
                    newversion="${versions[0]}.${versions[1]}.${versions[2]}"

                    `sed -i "s/$existing_version/$newversion/" $file`
                    echo "$file's version updated from $oldversion to $existing_version"
            fi
        fi
        # deleting the temporary file 
        rm './temp.yaml'
    fi
}

# compare and retrive the changed files
check_diff=`git diff ${second_last_commit_hash} --name-only`
files=$(echo $check_diff | tr " " "\n")

for file in $files
do
    echo $file
    # For chart service version or experiment
    if [[ "$file" =~ \version.yaml$ ]] || [[ "$file" =~ \experiment.yaml$ ]]; then
        versionInc $file
    fi
done

