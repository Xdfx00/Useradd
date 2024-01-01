#!/bin/bash

## Author : Xdfx 
## Github : Xdfx00 
## Date   : 31/12/2023

# set some colors for output messages
NOTE="$(tput setaf 3)[NOTE]$(tput sgr0)"
WARN="$(tput setaf 166)[WARN]$(tput sgr0)"


# Taking input to the user
	read -p "Enter username: " username
	read -p "Enter password: " -s password

# Checking user alreade exists
grep "^$username" /etc/passwd > /dev/null
if [[ $? == 0   ]]
then
	echo -e "\n$username  Already exsits...."
	exit 1
fi

# loop until valid input is provided

while true
do
	printf "${WARN} please select to continue!!!!\n\n"
	read -p "${NOTE} Would you like to add this user? (y/n): " choice
	
	# check user input
	if [[ $choice == "y" || $choice == "Y"  ]]
	then
		echo "Adding user..."
		useradd -m -p "$password" "$username"
		echo "user has been added"
		exit 0
		break
	elif [[ $choice == "n" || $choice == "N"  ]]
	then
	     echo "try to run this scritp again....."
	     break
     else
	     echo "Invaild choice. Please enter 'y' or 'n'."
	fi
done



