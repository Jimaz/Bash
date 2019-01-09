#!/bin/bash

if [[ ! :$PATH: == *"$HOME/tests/hello/"* ]]; then
	# The directory is not on the path 
	read -rp 'Input full path for program: ' hello
	echo

	export PATH=$PATH:$hello
	echo "GREAT! Now the path has been exported"
else
	# Allright, the directory is on the path
	echo "Path already exported. Nothing to do... o^o"

fi

# Let's check if it works



$hello/hello.sh
