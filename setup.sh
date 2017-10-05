#!/usr/bin/env bash
proj_root=$(pwd)
ls $proj_root/patches | grep macOS | while read file;
do
    git am < $proj_root/patches/$file
    git add -A
    git commit -m 'patching: '$file
    git push origin $(git branch | grep \* | cut -c 3-)
done