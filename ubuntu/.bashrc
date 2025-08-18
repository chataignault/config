HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
PURPLE='\033[0;35m'
NC='\033[0m'

shopt -s cmdhist
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar
shopt -s direxpand
shopt -s dirspell
shopt -s dotglob
shopt -s expand_aliases
shopt -u extglob

# path extensions
export PATH="$PATH:~/code/tasks/bin"

# dircolors
if [ -f ~/.dircolors ]; then
    eval "$(dircolors -b ~/.dircolors)"
else
    eval "$(dircolors -b)"
fi

# lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# installation
alias sau='sudo apt upgrade'
alias sal='sudo apt list --installed'
alias saar='sudo apt autoremove' # --purge
alias sar='sudo apt remove'
alias sap='sudo apt purge'
alias dpkg='dpkg'

# device
alias lsp='lspci' # print components
alias lsmod='lsmod' # kernel modules status
alias dmesg='dmesg' # kernel buffer logs
alias modprobe='modprobe' # add and remove modules from linux kernel
alias hn='hostname -i' # show local IP
alias hnc='hostnamectl'
alias systelctl='systemctl' # systemd service manager

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -Fa --color=auto --show-control-chars --group-directories-first'
alias c='clear'
alias reboot='reboot'

export cod='~/code'
export art='~/cours/Articles'

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
alias gcl='git config --list'

# uv
alias uva='source .venv/bin/activate'
alias uvs='uv sync'
alias uvb='uv build'
alias uvv='uv venv -p'

# ruff
alias rf='ruff format'

# rustup
alias ru='rustup update'

# cargo 
alias ct='cargo test'
alias cc='cargo check'
alias cb='cargo build'
alias cr='cargo run'
alias ca='cargo add'
alias ci='cargo init'
alias cbe='cargo bench'
alias cf='cargo fmt'
alias ccf='cargo clippy -fix'
alias cnt='cargo +nightly test'
. "$HOME/.cargo/env"

# podman
alias pb='podman build'
alias pr='podman run'
alias pls='podman image ls'

# tex
alias pdfu='pdfunite'

# npm
alias nps='npm start'
alias npi='npm install'
alias npp='npx prettier . -write'

# ocaml
eval $(opam env)

# functions : use 'declare -F' to list 
al() {
    echo 'Current aliases:'
    echo '---------------'
    alias | sort | sed 's/alias //' | column -t -s '='
}

clean_cache() {
	echo "Current cache size :"
	sudo du -sh /var/cache/apt
	while true; do
		read -p "Do you want to clean cache ? " yn
		case $yn in
			[Yy]* ) sudo apt-get clean; break;;
			[Nn]* ) break;;
			* ) echo "Either yes or no ";;
		esac
	done
}

# starship
export STARSHIP_CONFIG=~/.config/starship.toml

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# Node.js Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 


. "$HOME/.local/bin/env"

