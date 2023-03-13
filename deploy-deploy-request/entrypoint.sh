#!/bin/sh -l

command="pscale deploy-request deploy $1 $2 --org $3 \
  --service-token $PLANETSCALE_TOKEN --service-token-id $PLANETSCALE_TOKEN_NAME"

cmdout=$(eval $command)

if [ "true" == "$4" ];then
  $statusout =
fi

number=$(jq -n "$cmdout" | jq '.number')
echo "number=$number" >> $GITHUB_OUTPUT