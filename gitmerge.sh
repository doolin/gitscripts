#!/bin/sh


# TODO: find a way to read this code from a file,
# maybe using source...

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


rm -rf gitmerge

echo "${purplef}Let's first create a repo with no branches or subdirectories:${reset}"
mkdir gitmerge
cd gitmerge
git init .
echo "${purplef}Now we add a small amount of code to it:${reset}"

echo "File 1 first edit." >> file1.txt
git add file1.txt
git commit -m"First commit for file1.txt"
echo "${purplef}Now lets create a repo in /tmp to serve as a remote:${reset}"
# Save where we are now...
home=`pwd`
#echo $home
remotedir=/tmp/remotedir
rm -rf $remotedir
mkdir -p $remotedir
cd $remotedir
git init .
echo "File 2 first edit." >> file2.txt
git add .
git commit -m"First commit for file2.txt"
mkdir subdir
cd subdir
echo "File subdir first edit." >> subdir.txt
cd ..
git add subdir
git commit -m"First commit for subdir"
cd $home
echo "${purplef}Now we have repos here locally and on the remote."
echo "Let's try the merge and see what happens...${reset}"

# git remote add test ../B && git fetch test
git remote add subdir $remotedir && git fetch subdir
echo "${purplef}At this point it would be smart to stop and investigate"
echo "the behavior of the merge manually...${reset}"
git merge subdir/master
echo  "\033[38;5;148m${cyanf}No! We need to do a filter branch on some temp clones first...${reset}"


