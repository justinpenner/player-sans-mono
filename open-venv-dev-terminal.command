#! /bin/bash

# A series of ancient runes that represents the folder this script is in
cd "${0%/*}"

# Create virtual environment if it doesn't exist
if [ ! -d "venv-dev" ]
then
	python3 -m venv venv-dev
	source venv-dev/bin/activate
	pip install wheel
	pip install -r requirements-dev.txt
fi

source venv-dev/bin/activate
export PS1="venv-dev:\W\$ "
clear
$SHELL
