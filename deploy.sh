#!/bin/bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "master" ]
then 
    echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!" 
    exit 0
fi

rev=$(git rev-parse --short HEAD)

cd _book

git initgit config user.name "tsrot"

git config user.email "me@xieliqun.com"

git remote add upstream "https://github.com/huijiesuan/doc.git"

git fetch upstream

git reset upstream/master

echo "huijiesuan.github.io" > CNAME

git add -A

git commit -m "rebuild pages at ${rev}"

git push -q upstream HEAD:master