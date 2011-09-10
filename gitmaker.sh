#!/bin/sh

echo "This script needs to be run from /tmp"
#exit

# Return values from command line:
# http://git.661346.n2.nabble.com/command-return-values-td5279263.html

rm -rf gittester

mkdir "gittester"
cd gittester
git init

echo "File 1 first edit." >> file1.txt
git add file1.txt
git commit -m"First commit for file1.txt"

echo "\nFile 1 second edit." >> file1.txt
git add file1.txt
git commit -m"Second commit for file1.txt"

echo "Here is a second file" >> file2.txt
git add file2.txt
git commit -m"First commit for file2.txt"

echo "Here is a third file" >> file3.txt
git add file3.txt
git commit -m"First commit for file3.txt"


git checkout -b topic

echo "File 1 first edit from topic branch." >> file1.txt
git add file1.txt
git commit -m"First commit for file1.txt from topic branch"

git checkout master

git merge topic

git checkout topic

echo "File 3 first edit from topic branch." >> file3.txt
git add file3.txt
git commit -m"First commit for file3.txt from topic branch"

echo "File 3 second edit from topic branch." >> file3.txt
git add file3.txt
git commit -m"Second commit for file3.txt from topic branch"

echo "File 3 third edit from topic branch." >> file3.txt
git add file3.txt
git commit -m"Third commit for file3.txt from topic branch"

git checkout master


# no colors...
#foo=`git reflog`
#echo "\nReflog:\n$foo"

# colorized...
git reflog

echo "Now do git show-branch --color --more=10"
echo "This repo can be used for examining how to cherry pick"



echo "Now to demonstrate how diff and patch (apply?) work"
# 1. Make a new branch
# 2. Make a change in an existing file
# 3. commit, diff the changed file to the original branch
# 4. checkout the original branch
# 5. Apply the patch
# 6. Check for differences between the changed and the original

