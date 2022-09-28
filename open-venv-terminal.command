#! /bin/bash

# A series of ancient runes that represents the folder this script is in
cd "${0%/*}"

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]
then
	python3 -m venv venv
	source venv/bin/activate
	pip install wheel
	pip install -r requirements.txt
fi

source venv/bin/activate
export PS1="venv:\W\$ "
clear
$SHELL
