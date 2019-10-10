import re
import sys
from packaging import version
# semantic version regex
regex = "^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$"
existing_version = sys.argv[1]
old_version = sys.argv[2]
result = re.search(regex, existing_version)

if result:
    if version.parse(existing_version) > version.parse(old_version):
        print("version validation successful")
        sys.exit(0) # on success
    elif version.parse(existing_version) == version.parse(old_version):
        print("versions are equal")
        sys.exit(2) # on success
    else:
        print("version validation failed")
        sys.exit(1) #on failure
else:
    print("version validation failed")
    sys.exit(1) #on failure