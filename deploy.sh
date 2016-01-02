#!/bin/bash

# Basically from https://medium.com/philosophy-logic/publishing-gh-pages-with-travis-ci-53a8270e87db
set -e
rm -rf _plt || exit 0;
mkdir -p _plt;
cd _plt
git init
git config user.name "Ed Tsang"
git config user.email "edwardt.tril@gmail.com"
git add .
git commit -m "Deploy to GitHub"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master > /dev/null 2>&1
