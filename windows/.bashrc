
export cimp="$HOME/Cours/Cours_Imperial"
export PATH="/c/miniconda3/scripts:$PATH"
export PATH="/c/Program Files/Microsoft VS Code/Microsoft VS Code/bin:$PATH"
export NVM_DIR="$HOME/.nvm"

alias gc="git commit -m"
alias ga="git add"
alias gp="git push"
alias gd="git diff"
alias gs="git status"
alias gl="git log --oneline"
alias gb="git branch -a"
alias gr="git restore"
alias grs="git restore --staged"
alias uva="source .venv/Scripts/activate"
alias unz="find . -name '*.zip' -print0 | xargs -0 -I {} -P 10 unzip {}"
alias ..="cd .."

aliases() {
    echo "Current aliases:"
    echo "---------------"
    alias | sort | sed 's/alias //' | column -t -s '='
}

uvp() {
	# initialise python project
	uv init $1
	cd $1
	mkdir -p test data src/utils
	rm hello.py
	uv venv --python=3.11
	source .venv/Scripts/activate
	git init .
	cp c:/code/config/python_gitignore ./.gitignore
	# create remote branch
	curl POST github.com/lchataignault/$1
}

rup() {
	# initialise rust project
	cargo new $1
	cd $1
	git init .
	# create git repo
}

syncf() {
	# synchronise folders
	echo Synchronise $1 and $2
}


