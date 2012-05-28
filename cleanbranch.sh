#!/bin/sh

# This is for showing how to create a clean branch with git.

if [ -e cleanbranch ]
then
  rm -rf cleanbranch
fi

mkdir cleanbranch
cd cleanbranch
git init
echo "file1" > file1.txt
git add .
git commit -m"added file1.txt"

git symbolic-ref HEAD refs/heads/cleanbranch
rm .git/index
git clean -fdx

echo "file2" > file2.txt
git add .
git commit -m"added file2.txt"

git branch -a

ls
git checkout master
ls
