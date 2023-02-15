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

if [ "true" == "$7" ];then
  password_name="gha$( date +%s )"
  jout=$(pscale password create $1 $2 $password_name -f json)
  echo "password_name=$password_name" >> $GITHUB_OUTPUT
  echo "username=$( jq -r '.name' <<< "${jout}")" >> $GITHUB_OUTPUT
  echo "password=$( jq -r '.plain_text' <<< "${jout}")" >> $GITHUB_OUTPUT
  echo "hostname=$( jq -r '.database_branch.access_host_url' <<< "${jout}")" >> $GITHUB_OUTPUT
fi