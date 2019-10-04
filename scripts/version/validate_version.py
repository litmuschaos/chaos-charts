import re
import sys
from packaging import version

# semantic version regex
regex = "^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$"
oldversion = sys.argv[1]
newversion = sys.argv[2]
regex_match = re.search(regex, sys.argv[1])
# compare the oldversion and newversion
version_compare = version.parse(oldversion) < version.parse(newversion)

if regex_match:
    if version_compare:
        print("version validation successful")
        sys.exit(0) # on success
    else:
        print("version validation failed")
        sys.exit(1) #on failure     
else:
    print("version validation failed")
    sys.exit(1) #on failure 