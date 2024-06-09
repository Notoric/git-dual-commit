#!/bin/bash
# Define the name of the repo as the current directory name
current_dir=$(basename "${PWD}")

# Create a readme file
touch README.md

# Initialize git repository
git init
git remote add all https://github.com/Notoric/$REPO.git
git remote set-url --add --push all https://github.com/Notoric/$REPO.git
git remote set-url --add --push all https://gitea.notoricloud.net/Notoric/$REPO.git
git add .
git branch -M main
git commit -m "initial commit"
git push all main