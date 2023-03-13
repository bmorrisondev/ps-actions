#!/bin/sh -l

command="pscale branch create $1 $2 --org $3 \
  --service-token $PLANETSCALE_TOKEN --service-token-id $PLANETSCALE_TOKEN_NAME"

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

if [ "true" == "$7"];then
  # wait for branch creation
  . /.pscale/cli-helper-scripts/wait-for-branch-readiness.sh
  wait_for_branch_readiness 10 "$1" "$2" "$3" 20
fi