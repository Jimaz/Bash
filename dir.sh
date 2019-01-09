#!/bin/bash
if [ "$1" == "-h" ]; then
  echo "How to use this: '$0' is some good stuff! Let's create some directories"
  exit 0
fi

# take every directory and sort by first numeric character
dir=$(ls -1 -d [0-9]*\.* | sort -n | awk '{ print substr($1,1,1) }')


n=${dir: -1}

n=$((n+1))

PS3="Select a number: "
echo "You are going to create a file, do you wish to continue?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

read -p 'Insert name for file: ' name

while ! mkdir $n.$name
do
    n=$((n+1))
done







