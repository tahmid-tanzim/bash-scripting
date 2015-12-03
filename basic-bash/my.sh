
#!/bin/bash
# This is a basic bash script.

[[ "cat" == "cat" ]]
# OUTPUT: 0 (TRUE)
echo $?

[[ "cat" = "dog" ]]
# OUTPUT: 1 (FALSE)
echo $?

[[ 20 -gt 100 ]]
# OUTPUT: 1 (FALSE)
echo $?

a=""
b="cat"

[[ -z $a && -n $b ]]
# OUTPUT: 0 (TRUE)
echo $?