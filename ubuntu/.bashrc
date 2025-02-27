HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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

# cargo 
alias ct='cargo test'
alias cc='cargo check'
alias cb='cargo build'

al() {
    echo 'Current aliases:'
    echo '---------------'
    alias | sort | sed 's/alias //' | column -t -s '='
}

# fs
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias pls='podman image ls'
alias hn='hostname -I'

. "$HOME/.cargo/env"

eval "$(starship init bash)" 


