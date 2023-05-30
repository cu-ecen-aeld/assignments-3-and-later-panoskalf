#!/bin/bash
# finder.sh as per assignment 1 instructions: 
# https://www.coursera.org/learn/linux-system-programming-introduction-to-buildroot/supplement/bnixD/assignment-1-instructions
#
# usage: ./finder.sh FILESDIR SEARCHSTR 
# recursively searches files in FILESDIR for SEARCHSTR and prints out number of FILES and number of LINES which are matching

FILESDIR=$1
SEARCHSTR=$2

if [ $# -ne 2 ]
then
    echo "Error: not enough arguments"
    exit 1
fi

if [ ! -d  "$FILESDIR" ]
then
    echo "Error: ${FILESDIR} is not a directory"
    exit 1
fi

FILES=$(grep -rl $SEARCHSTR $FILESDIR | wc -l)
LINES=$(grep -r $SEARCHSTR $FILESDIR | wc -l)

echo "The number of files are ${FILES} and the number of matching lines are ${LINES}"