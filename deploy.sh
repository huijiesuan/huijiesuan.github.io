#!/bin/bash



rev=$(git rev-parse --short HEAD)

cd _book

git config user.name "tsrot"

git config user.email "me@xieliqun.com"

git remote add upstream "https://$GH_TOKEN@github.com/huijiesuan/huijiesuan.github.io.git"

git fetch upstream

git reset upstream/master

echo "huijiesuan.github.io" > CNAME

git add -A

git commit -m "rebuild pages at ${rev}"

git push -q upstream HEAD:master