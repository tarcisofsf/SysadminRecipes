#!/bin/bash

# script to compress in tar with status  
# usage: tgz.sh folder

tar -Jc "$1" -P | pv -s $(du -sb "$1" | awk '{print $1}') | gzip > $1.tar.gz
