#!/bin/bash

# distribution
if command -v latex > /dev/null 2>&1; then
	echo "texlive already installed"
else
	echo -e "${PURPLE}Install texlive"
	sudo apt install texlive
fi

# compiler
if command -v latexmk > /dev/null 2>&1; then
	echo "latexmk already installed"
else
	echo -e "${PURPLE}Install latexmk"
	sudo apt install latexmk
fi

# package manager switched to user mode, 
# create default local package folder
if ! [ -d ~/texmf ]; then
	echo "Create default package directory at ~/texmf"
	mkdir ~/texmf
fi

# package management dealt with apt
if ! command -v apt-file >/dev/null 2>&1; then
	echo -e "${PURPLE}Install apt-file${NC}"
	sudo apt install apt-file
	sudo apt-file update
	echo -e "${PURPLE}Run 'apt-file search package-name' to find missing tex package install${NC}\n"
fi

