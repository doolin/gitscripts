#!/bin/sh

echo "This script needs to be run from /tmp"
exit

mkdir "gittester"
cd gittester
git init

echo "File 1 first edit." >> file1.txt
git add file1.txt
git commit -m"First commit for file1.txt"
