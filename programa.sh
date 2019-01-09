#/bin/bash

# check if script is in directory
if [[ ! -f $HOME/tests/hello.sh ]] ; then
    # oops, the script is not in directory
	read -rp 'Input full path for script: ' hello
   	echo

	echo 'Successfully created'

else

    # O.K., the script is in directory
	$HOME/tests/hello.sh
	echo "SCRIPT ALREADY EXISTS"

fi

