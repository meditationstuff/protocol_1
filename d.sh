#!/bin/bash

# run as so:
# ./d.sh

# deploy site to github pages

./m.sh
cp index.html ../meditationstuff.github.io/index.html
cd ../meditationstuff.github.io
git add index.html
git commit -m "deploy"
git push
cd ../protocol_1
