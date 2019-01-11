#!/bin/bash

# Define the help function
function help(){
    echo -e "Usage: \n $0 [-h] [-help] [-1] [-2] [-i] [-f] [-r]" 1>&2 "\n"
    echo -e "Available options: \n -h | -help \t Prints help. Subsequent arguments will be ignored. \n -1 <file> \n \t Input R1 FASTQ file. \n -2 <file> \n \t Input R2 FASTQ file. \n -i <int> \n \t Sample ID \n -f <file> \n \t FASTA file for iteration \n -r <STR>\n \t Input RUN ID for testing multiple parameters on the same sample."
    exit 1;
}

# Define main function to check arguments
function main(){
	check "$@" 
		
		if [[ "$fastq1" ]]; then 
			if [[ "$fastq1" != *".fastq" && "$fastq1" != *".fq.gz" ]]; then				
			echo "Unkown format for FASTQ R1 file" >&2
			exit 1

			elif [[ ! -e $fastq1 ]]; then
			echo "The filename provided for R1.fastq does not exists." >&2
			exit 1
			fi
		fi

		if [[ "$fastq2" ]]; then
			if [[ "$fastq2" != *".fastq" && "$fastq2" != *".fq.gz" ]]; then				
			echo "Unkown format for FASTQ R2 file" >&2
			exit 1

			elif [[ ! -e $fastq1 ]]; then
			echo "The filename provided for R2.fastq does not exists." >&2
			exit 1
			fi
		fi

		if [[ "$fasta" ]]; then 
			if [[ "$fasta" != *".fasta" ]]; then				
			echo "Unkown format for FASTA file" >&2
			exit 1
			
			elif [[ ! -e $fasta ]]; then
			echo "The filename provided for FASTA file does not exists." >&2
			exit 1
			fi		
		fi

		if ! $id_mandatory; then
   			echo "-i must be included for a sample ID" >&2
   			exit 1
		fi

		if ! $f_mandatory; then
   			echo "-f must be included for iterating a FASTA file" >&2
   			exit 1
		fi

		if ! $r_mandatory; then
   			echo "-r must be included for RUN ID" >&2
   			exit 1
		fi


}

#Initialize the default values for the variables?
#fastq1="R1";
#fastq2="R2";

<<options
-fastq,-fastq2,-id_sample,-fasta,-id_run
options

# If no arguments provided, print help
if [[ $# == 0 ]]; then
	help
	exit 1
fi


# Check getopts
function check(){
	local OPTIND option
#Define the getopts variables
	options=":h1:2:i:f:r:";

	id_mandatory=false
	f_mandatory=false
	r_mandatory=false

	# Execute getopts
	while getopts "$options" option 
	do
		case "$option" in 
			h ) help 
				>&2
				;;
			1 ) fastq1="$OPTARG"
				echo "Reading R1.fastq file"
				>&2
				;;
			2 ) fastq2="$OPTARG"
				echo "Reading R2.fastq file"
				>&2
				;;
			i ) id_sample="$OPTARG"
				id_mandatory=true
				echo "Retrieving ID sample"
				>&2
				;;
			f ) fasta="$OPTARG"
				f_mandatory=true
				echo "Reading FASTA file"
				>&2
				;;
			r ) run="$OPTARG" 
				r_mandatory=true
			    echo "Retrieving ID run"
				>&2
				;;
			\? ) echo "Invalid option -$OPTARG" >&2;
				 echo "Type script.sh -h for more information"
				 exit 1
				;;
			: ) echo "Option $OPTARG requires argument"; help >&2;
				exit 1
				;;
			* ) char="$OPTARG"
				echo "Unkown option -$OPTARG"; helo >&2;
				exit 1
				;;
		esac
	done

	shift $((OPTIND-1))
	
}


function exec(){
	echo "Running..."

}

main "$@"

exec "$@"






