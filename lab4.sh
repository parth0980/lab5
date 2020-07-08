#!/bin/sh

#Parth Barot 216827107


source ./lab4-help.sh

#Checking if any arguments were provided
if test $# -eq 0
then
   echo "You should enter the path name for class files"
   echo "Use: lab4.sh path"
   echo "Example lab4.sh ~"
   exit 2
fi

#Checking if the path specified is readable
if test -r $1
then
  #getting a count of read "*.rec" files
  count=find $1 -type f -name '*.rec' -readable | wc -l
  if test $count -eq 0
  then
    echo "There are no readable *.rec files that exist in the specified path, or its subdirectories"
    exit 1
  fi
fi

#By this point there are some readable files
#Display a prompt to the user.
while test $count -gt 0
do
  printf "command: "
  read command
  case $command in
  "l" | "list") echo 'Here is the list of found class files:'
  find $1 -type f -name '*.rec';;
  "ci") ci_func $1;;
  "sl") sl_func $1;;
  "sc") sc_func $1;;
  "cc") echo "There are $count course files.";;
  "h" | "help") help_func;;
  "q" | "quit") echo "goodbye"
  exit 0;;
  *) echo 'Unrecognized command!';;
  esac
done
