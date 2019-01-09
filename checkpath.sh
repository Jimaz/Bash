#!/bin/bash

if [[ ! :$PATH: == *"$HOME/tests/hello/"* ]]; then
	# oops, the directory is not on the path
	read -rp 'Input full path for program: ' hello
	echo

	export PATH=$PATH:$hello
	echo "GREAT! Now the path has been exported"
else
	# OK, the directory is on the path
	echo "Path already exported. Nothing to do... I0I"

fi

# Let's check if it works



$hello/hello.sh
