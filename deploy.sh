#!/bin/bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "source" ]
then 
    echo "This commit was made against the $TRAVIS_BRANCH and not the source! No deploy!" 
    exit 0


rev=$(git rev-parse --short HEAD)

cd _book

git config user.name "tsrot"

git config user.email "me@xieliqun.com"

git remote add upstream "https://$GH_TOKEN@github.com/huijiesuan/huijiesuan.github.io.git"

git fetch upstream

git reset upstream/source

echo "huijiesuan.github.io" > CNAME

touch .

git add -A

git commit -m "rebuild pages at ${rev}"

git push -q upstream HEAD:source