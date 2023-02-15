#!/bin/sh -l

# if [ -n "$4" ];then
#   echo "var is set"
# else 
#   echo "var is NOT SET"
# fi

echo "5 is $5"

command="pscale branch create $1 $2 --org $3 -f json"

if [ -n "$4" ];then
  command="$command --from $4"
fi

if [ "true" == "$5" ];then
  echo "tis true"
fi

echo $command

# branch_name=$( jq -r '.name' <<< "${output}")

# echo $branch_name