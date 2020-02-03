#!/bin/bash

# (will prompt for password)
curl -u 'hchiam' https://api.github.com/user/repos -d '{"name":"learning-react-fe-and-be", "description":"Learning from a freeCodeCamp tutorial: https://www.freecodecamp.org/news/create-a-react-frontend-a-node-express-backend-and-connect-them-together-c5798926047c/"}'
git remote add origin 'git@github.com:hchiam/learning-react-fe-and-be.git'
git add .
git commit -m "Set up repo"
git remote set-url origin https://github.com/hchiam/learning-react-fe-and-be.git
git push --set-upstream origin master
echo; echo -------; echo;
git status

# This file was first created using the Yeoman generator
#  generator-hchiam-learning:
#  https://www.npmjs.com/package/generator-hchiam-learning
