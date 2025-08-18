#!/bin/bash

if ! command -v starship > /dev/null 2>&1 ; then
	echo "Install Starship..."
	curl -sS https://starship.rs/install.sh | sh
else
	echo "Starship already installed :"
	which starship
fi


