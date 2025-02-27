
export cimp="$HOME/Cours/Cours_Imperial"
export dw="$HOME/Downloads"
export PATH="/c/miniconda3/scripts:$PATH"
export PATH="/c/Program Files/Microsoft VS Code/Microsoft VS Code/bin:$PATH"
export NVM_DIR="$HOME/.nvm"

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias cod='cd /c/code/'
alias ls='ls -Fa --color=auto --show-control-chars'
alias c='clear'
alias hn='hostname -I'

# fs
alias unz="find . -name '*.zip' -print0 | xargs -0 -I {} -P 10 unzip {}"
alias etex='source extract_tex.sh &'
alias gat='source gather_pdf_notes.sh &'
alias aln='rm $cimp/all_notes.pdf && pdfunite $cimp/all_notes/* $cimp/all_notes.pdf'
alias ex='explorer'
alias spdf='SumatraPDF'

# git
alias gc='git commit -m'
alias gcx='git commit --no-verify -m'
alias ga='git add'
alias gp='git push'
alias gpl='git pull'
alias gd='git diff'
alias grm='git remove --cached'
alias gs='git status --short'
alias gt='git stash'
alias gtu='git stash --include-untracked'
alias gl='git log --oneline'
alias gb='git branch -a'
alias gr='git restore'
alias grs='git restore --staged'
alias grb='git reset -i' # squash

# uv
alias uva='source .venv/Scripts/activate'
alias uvs='uv sync'
alias uvb='uv build'
alias uvv='uv venv -p'

# ruff
alias rf='ruff format'

# s3
alias ls3='aws s3 ls'
alias cp3='aws s3 cp'

# podman
alias pb='podman build'
alias pr='podman run'

# tex
alias pdfu='pdfunite'

al() {
    echo 'Current aliases:'
    echo '---------------'
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
	curl -X POST \
		-H "Authorization: Bearer $(cat c:/code/config/git_token)" \
  		-H 'Accept: application/vnd.github.v3+json' \
  		https://api.github.com/user/repos \
		-d "{'name': ''$1'','private':false}"
	git add README.md
	git commit -m 'initial commit'
	git branch -M main
	git remote add origin git@github.com:chataignault/$1.git
	git push --set-upstream origin main
}

rup() {
	# initialise rust project
	cargo new $1
	cd $1
	git init .
 	curl -X POST \
		-H "Authorization: Bearer $(cat c:/code/config/git_token)" \
  		-H 'Accept: application/vnd.github.v3+json' \
  		https://api.github.com/user/repos \
		-d "{'name': ''$1'','private':false}"
	echo '# $1' > README.md
	git add README.md
	git commit -m 'initial commit'
	git branch -M main
	git remote add origin git@github.com:chataignault/$1.git
	git push --set-upstream origin main
}

syncf() {
	# synchronise folders
	echo Synchronise $1 and $2 for extension $3
	source synchronise_local.sh $@
}


