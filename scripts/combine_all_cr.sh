directories=$(find ../charts -maxdepth 1 -mindepth 1 -type d)
for directory in $directories
do
	subDirectories=$(find $directory -maxdepth 1 -mindepth 1 -type d)
	echo -e "---\n" > $directory/experiments.yaml
	for subDirectory in $subDirectories
	do     

               if test -f "$subDirectory/experiment.yaml"; then
	          cat $subDirectory/experiment.yaml >> $directory/experiments.yaml
	          echo -e "\n---\n" >> $directory/experiments.yaml                  		  
	       fi
        done
done
echo "validating combine charts for generic"
cat ../charts/generic/experiments.yaml
echo "validating combine charts for openebs"
cat ../charts/openebs/experiments.yaml

