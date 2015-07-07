#!/bin/bash

# script to split a file in other files of m lines
#
# usage: sh splitLines.sh file 1000000
#
#Put first the name of file and after the number of lines of generated files
file=$1

offset=$2

lastLine=$(wc -l $file | cut -d' ' -f1)

#DEBUG
#echo "$file";echo "$offset";echo "$lastLine"

for (( i = 1; i <= 7; i = i+offset )); do
  initiaLine="$i";
  let "finaLine= $i + $offset - 1";
  cat ${file} | sed -n "${initiaLine},${finaLine}p" >> newFile-${i}
done
