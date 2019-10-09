## Version

## Implementation
Whenever there is any commit in charts it will increment the patch version by one unit

Steps:
1. version_maker.sh will take the second last commit because the latest commit is the changes which are done by the user by which Travis is triggered.

2. It compares the changes with the second last commit and stores the changed file to an array.

3. It will go through each file and increment a patch version to each changed file