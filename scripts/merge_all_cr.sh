directories=$(ls -l ../charts/ | grep ^d | awk '{print $9}')
for directory in $directories
do
	echo -e "---\n" > ../charts/$directory/experiments.yaml
	subDirectories=$(ls -l ../charts/$directory | grep ^d | awk '{print $9}')
	for subDirectory in $subDirectories
	do 
	cat ../charts/$directory/$subDirectory/experiment.yaml >> ../charts/$directory/experiments.yaml
	echo -e "\n---\n" >> ../charts/$directory/experiments.yaml
        done
done

