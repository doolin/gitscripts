#!/bin/sh

# create a good looking graph with dot
echo "digraph G {"
git log --pretty=format:"%h %p" $* \
| perl -lane 'print qq("$F[0]";), map {qq("$_"->"$F[0]";)} @F[1..$#F]'
echo "}"