#!/bin/bash


# Build the project.
hugo

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push
git subtree push --prefix=public --squash git@github.com:spacelis/spacelis.github.io master
