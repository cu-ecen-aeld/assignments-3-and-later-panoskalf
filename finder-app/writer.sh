#!/bin/bash
# writer.sh as per assignment 1 instructions: 
# https://www.coursera.org/learn/linux-system-programming-introduction-to-buildroot/supplement/bnixD/assignment-1-instructions
#
# usage: ./writer.sh WRITEFILE WRITESTR 
# creates a new file with name and path WRITEFILE with content WRITESTR overwritting any existing file

WRITEFILE=$1
WRITESTR=$2

if [ $# -ne 2 ]
then
    echo "Error: not enough arguments"
    exit 1
fi

if [ ! -d "$(dirname "$WRITEFILE")" ]
then
    mkdir -p "$(dirname "$WRITEFILE")"
fi

echo "$WRITESTR" > "$WRITEFILE" 

if [ $? -eq 1 ]
then
    echo "Error: Could not create file"
    exit 1
fi