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
# 3. commit
# 4. checkout the original branch
# 5. diff the changed file to the original branch
# 6. Apply the patch
# 7. Check for differences between the changed and the original

## Make a new branch
git checkout -b newbranch

# Make change to existing file
echo "\nFile 1 newbranch edit." >> file1.txt

# Commit the change in newbranch
git add file1.txt
git commit -m"First newbranch commit for file1.txt"

# Check out master
git checkout master

# diff the files between master and newbranch
git diff -p master:file1.txt newbranch:file1.txt


# Makes 'em blinkin':
echo -e "My favorite color is \033[38;5;148mYellow-Green\033[39m"


# From http://www.intuitive.com/wicked/showscript.cgi?011-colors.sh
initializeANSI()
{
  esc=""

  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"
  
  blackb="${esc}[40m";   redb="${esc}[41m";    greenb="${esc}[42m"
  yellowb="${esc}[43m"   blueb="${esc}[44m";   purpleb="${esc}[45m"
  cyanb="${esc}[46m";    whiteb="${esc}[47m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"

  reset="${esc}[0m"
}

# note in this first use that switching colors doesn't require a reset
# first - the new color overrides the old one.

initializeANSI

cat << EOF
${yellowf}This is a phrase in yellow${redb} and red${reset}
${boldon}This is bold${ulon} this is italics${reset} bye bye
${italicson}This is italics${italicsoff} and this is not
${ulon}This is ul${uloff} and this is not
${invon}This is inv${invoff} and this is not
${yellowf}${redb}Warning I${yellowb}${redf}Warning II${reset}
EOF

# More:
# http://linuxtidbits.wordpress.com/2008/08/13/output-color-on-bash-scripts-advanced/
# http://tldp.org/LDP/abs/html/colorizing.html