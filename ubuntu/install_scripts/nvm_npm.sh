
if ! command -v nvm > /dev/null 2>&1; then
	# Download and install nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
	
	# in lieu of restarting the shell
	\. "$HOME/.nvm/nvm.sh"
	
	# Download and install Node.js:
	nvm install 24
	
	# Verify the Node.js version:
	node -v 
	nvm current 
	npm -v 
fi

