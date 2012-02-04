#!/bin/sh


# http://randyfay.com/node/91
# http://book.git-scm.com/4_rebasing.html
# http://darwinweb.net/articles/the-case-for-git-rebase
# http://blog.woobling.org/2009/05/git-rebase-considered-awesome.html

# Everything below this line needs changing.

echo "This script needs to be run from /tmp"
#exit

# Return values from command line:
# http://git.661346.n2.nabble.com/command-return-values-td5279263.html

rm -rf gittester

mkdir "gittester"
cd gittester
git init

