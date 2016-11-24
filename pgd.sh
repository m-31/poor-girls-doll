#!/bin/sh
# poor girl's deployment helpers

# 
# usage: 
# execute local script $1 on host $2 as root
#    cat pgd.sh $1 | ssh -q -l root $2 sh -sl

set -e

#############################################################################
## functions

## add a given line to a file if it is not already there
# $1 file
# $2 line
function add_line_if_not_already_there () {
  grep -q -F "$2" "$1" || echo "$2" >> "$1"
}

## create a file with given content if it is not already there and has that
# contents
# $1 file name
# $2 file content
function assert_file_contents () {
  echo "$2" | diff - "$1" &>/dev/null || echo "$2" > "$1"
}

## replace search string with replacement string within file
# $1 file
# $2 search string
# $2 replacement string
function replace_string () {
  grep -vq "$2" "$1" || sed -i "s/$2/$3/g" $1
}

## install package if missing
# $1 package
function install() {
  yum -q list installed $1 &>/dev/null || yum install -y $1
}


#############################################################################
## main processsing

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
