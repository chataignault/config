
export cimp="$HOME/Cours/Cours_Imperial"
export PATH="/c/miniconda3/scripts:$PATH"
export NVM_DIR="$HOME/.nvm"

alias gc="git commit -m"
alias ga="git add"
alias gp="git push"
alias gd="git diff"
alias gs="git status"
alias gl="git log --oneline"
alias gb="git branch -a"
alias uva="source .venv/Scripts/activate"
alias unz="find . -name '*.zip' -print0 | xargs -0 -I {} -P 10 unzip {}"
alias ..="cd .."

aliases() {
    echo "Current aliases:"
    echo "---------------"
    alias | sort | sed 's/alias //' | column -t -s '='
}

uvp() {
	# create python project
	uv init $1
	cd $1
	mkdir -p test data src/utils
	rm hello.py
	cp c:/code/config/standard_gitignore ./.gitignore
	uv venv --python=3.11
	source .venv/Scripts/activate
}
	
