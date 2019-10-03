directories=$(find ./charts -maxdepth 1 -type d)
for directory in $directories
do
	if [ $directory == "./charts" ]
        then 
		continue
        fi
	subDirectories=$(find $directory -maxdepth 1 -type d)
	for subDirectory in $subDirectories
	do     
	       if [ $subDirectory == $directory ] 
	       then 
		       continue
	       fi
               if test -f "$subDirectory/experiment.yaml"; then	       
	       if test -f "$directory/experiments.yaml"; then
	          cat $subDirectory/experiment.yaml >> $directory/experiments.yaml
	      else
	          cat $subDirectory/experiment.yaml > $directory/experiments.yaml
	      fi
	      echo -e "\n---\n" >> $directory/experiments.yaml                  		  
	       fi
        done
done
echo "validating combine charts for generic"
cat ./charts/generic/experiments.yaml
echo "validating combine charts for openebs"
cat ./charts/openebs/experiments.yaml

