#!/bin/bash

command="pscale branch create $1 $2 --org $3"

if [ -n "$4" ];then
  command="$command --from $4"
fi

if [ -n "$5" ];then
  command="$command --restore $5"
fi

if [ -n "$6" ];then
  command="$command --region $6"
fi

eval $command

if [ "true" == "$7" ];then
  # wait for branch creation
  echo "waiting..."
  . /.pscale/cli-helper-scripts/wait-for-branch-readiness.sh
  echo "got here"
  wait_for_branch_readiness 10 "$1" "$2" "$3" 20
  echo "after"
fi