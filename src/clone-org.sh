#!/bin/bash
#Script to clone all the repos in an organisation

ORG_NAME="virtual-labs" #organization name
ACCESS_TOKEN="<your GitHub access token>"

# Get a list of repository names for the organization
REPO_LIST=$(curl -s -H "Authorization: token $ACCESS_TOKEN" "https://api.github.com/orgs/$ORG_NAME/repos" | jq -r '.[].name')

#jq is a popular command-line JSON processor that is used in the script to parse the JSON response from the GitHub API. 
#Install jq before running this script "sudo apt-get install jq"
 
# Construct the SSH URLs for each repository
# Note that this script assumes that you have SSH access to the repositories. If not, please add it in your profile settings
for REPO_NAME in $REPO_LIST
do
    REPO_URL="git@github.com:$ORG_NAME/$REPO_NAME.git"
    git clone $REPO_URL
done
