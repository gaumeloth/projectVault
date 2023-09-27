#!/bin/bash

# Name of the new project
PROJECT_NAME=$1
# Brief description
DESCRIPTION=$2

# Check if the project name and description are provided
if [ -z "$PROJECT_NAME" ] || [ -z "$DESCRIPTION" ]; then
    echo "Usage: $0 <project_name> <description>"
    exit 1
fi

# Create the new project folder
mkdir -p $PROJECT_NAME

# Create a README.md for the new project
echo "# $PROJECT_NAME\n\n$DESCRIPTION" > $PROJECT_NAME/README.md

# Add a link to the new project in the main README
echo "- [$PROJECT_NAME](./$PROJECT_NAME/): $DESCRIPTION" >> README.md

# Add the new files to the Git repository
git add $PROJECT_NAME/ README.md

# Create a new commit
git commit -m "Added new project: $PROJECT_NAME"

# Optionally, push to the remote repository
# git push origin master
