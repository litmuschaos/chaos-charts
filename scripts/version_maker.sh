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
    # version=$(yaml $file spec.version)
    # eval $(yaml $file)
    # echo $spec_version 

    version=1.1.1
    echo $version
    SEMVER_REGEX="^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$"

    # if version is interger or float (semversion)
    result=sudo python ./semversion_checker.py $version
    echo type($result)
    # com="valid"
    # if [[ $result == "valid" ]]; then
    #     echo "in"
    #     # temp=$(echo ${file::-5})
    #     # echo $temp

    #     # removing old version file
    #     # oldversion=`rm ${temp}.v*.yaml`

    # # it will make a new csv with new version number and
    # # and rename the the version number in the base templatewith the default syntax {{ VERSION }}
    #     # `touch $temp.v$version.yaml && cp $file $temp.v$version.yaml`
    #     # `sed -i -E "s/version:[[:space:]]*$version/version:  {{ VERSION }}/" $file`
    # fi
    
done


