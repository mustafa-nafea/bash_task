#!/bin/bash

#function to generate random password
password_generator(){
	local length=$1
	local complex=$2

	#Define sets of characters
	local uppercase="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	local lowercase="abcdefghijklmnopqrstuvwxyz"
	local numbers="0123456789"
	local special="!@#$%&*!@#$%&*"
	local password=""

	#setting the char accroding to the complexity
	if [[ $complex = 1 ]]; then
		all_char="$numbers"

	elif [[ $complex = 2 ]]; then
		all_char="$numbers$lowercase"

	elif [[ $complex = 3 ]]; then
		all_char="$numbers$lowercase$uppercase"

	elif [[ $complex = 4 ]]; then
		all_char="$numbers$lowercase$uppercase$special"
	fi

	#setting the random password
	for (( i = 0; i < $length; i++ )); do
			local random_char=${all_char:RANDOM % ${#all_char}:1}
        	password="$password$random_char"
		done
	echo $password
}
#asking the user for the length and complexity of the password
read -p "Enter the length of the password: " length
read -p "Enter the complexity requirements: (1:for easy password  , 2:for medium password  , 3: for hard password  , 4:for very complex password)" complex
password_generator "$length" "$complex"