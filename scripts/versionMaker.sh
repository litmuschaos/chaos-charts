#! /bin/bash 

# parsing yaml file
function yaml() {
    hashdot=$(gem list hash_dot);
    if ! [ "$hashdot" != "" ]; then sudo gem install "hash_dot" ; fi
    if [ -f $1 ];then
        cmd=" Hash.use_dot_syntax = true; hash = YAML.load(File.read('$1'));";
        if [ "$2" != "" ] ;then 
            cmd="$cmd puts hash.$2;"
        else
            cmd="$cmd puts hash;"
        fi
        ruby  -r yaml -r hash_dot <<< $cmd;
    fi
}

# find files ended with chartserviceversion.yaml 
FIND_CMD=`find ./charts -type f -name "*chartserviceversion.yaml"`

# add all the files to an array called files
files=$(echo $FIND_CMD | tr " " "\n")

# looping from all the files
for file in $files
do
    # get the latest version from the template file
    version=$(yaml $file spec.version)
    echo $version

    # if version is interger or float then it will make a new csv with version number and
    # and rename the the version number with the default syntax {{ VERSION }}
    if [[ $version =~ ^[+-]?[0-9]*\.?[0-9]*$ ]];    then
        temp=$(echo ${file::-5})
        echo $temp

        # removing old version file
        oldversion=`rm ${temp}.v*.yaml`

        `touch $temp.v$version.yaml && cp $file $temp.v$version.yaml`
        `sed -i -E "s/version:[[:space:]]*$version/version:  {{ VERSION }}/" $file`
    fi

    
done


