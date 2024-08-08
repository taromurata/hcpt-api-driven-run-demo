#!/bin/bash

# 1. Define Variables

if [ -z "$1" ] ; then
  echo "Usage: $0 <organization>/<workspace>"
  exit 0
fi

ORG_NAME="$(cut -d'/' -f1 <<<"$1")"
WORKSPACE_NAME="$(cut -d'/' -f2 <<<"$1")"

# 2. Look Up the Workspace ID

WORKSPACE_ID=($(curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  https://app.terraform.io/api/v2/organizations/$ORG_NAME/workspaces/$WORKSPACE_NAME \
  | jq -r '.data.id'))

# 3. Look Up the latest Run ID
RUN_ID=($(curl \
    --header "Authorization: Bearer $TOKEN" \
    --header "Content-Type: application/vnd.api+json" \
    https://app.terraform.io/api/v2/workspaces/$WORKSPACE_ID/runs \
    | jq -r '.data[0].id'))

# 4. Apply the Run
curl \
    --header "Authorization: Bearer $TOKEN" \
    --header "Content-Type: application/vnd.api+json" \
    --request POST \
    https://app.terraform.io/api/v2/runs/$RUN_ID/actions/apply

