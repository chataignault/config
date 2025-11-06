
# ============================================================================
# CORE SHELL CONFIGURATION
# ============================================================================

# ----------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# ----------------------------------------------------------------------------
export LC_COLLATE="C"              # Sort order: dotfiles first (affects ls, glob)
export SELECTED_EDITOR="/snap/bin/nvim"  # Default editor for select-editor
export BROWSER=/snap/bin/firefox

# ----------------------------------------------------------------------------
# SHELL OPTIONS - COMMAND HISTORY
# ----------------------------------------------------------------------------
shopt -s cmdhist                   # Save multi-line commands as single history entry
shopt -s histappend                # Append to history file, don't overwrite

# ----------------------------------------------------------------------------
# SHELL OPTIONS - TERMINAL BEHAVIOR
# ----------------------------------------------------------------------------
shopt -s checkwinsize              # Update LINES and COLUMNS after each command

# ----------------------------------------------------------------------------
# SHELL OPTIONS - GLOBBING (FILE PATTERN MATCHING)
# ----------------------------------------------------------------------------
shopt -s globstar                  # Enable ** recursive directory matching
shopt -s direxpand                 # Expand directory names during tab completion
shopt -s dirspell                  # Autocorrect minor spelling errors in cd commands
shopt -s dotglob                   # Include hidden files in pathname expansion
shopt -u extglob                   # Disable extended pattern matching (!(...), *(...), etc.)

# ----------------------------------------------------------------------------
# SHELL OPTIONS - ALIASES
# ----------------------------------------------------------------------------
shopt -s expand_aliases            # Enable alias expansion in non-interactive shells

al() { # List current aliases
    echo 'Current aliases:'
    echo '---------------'
    alias | sort | sed 's/alias //' | column -t -s '='
}

# apt
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

# ----------------------------------------------------------------------------
# HISTORY CONFIGURATION
# ----------------------------------------------------------------------------
HISTCONTROL=ignoreboth             # Ignore duplicates and commands starting with space
HISTSIZE=1000                      # Number of commands to keep in memory
HISTFILESIZE=2000                  # Number of commands to keep in .bash_history file

# ----------------------------------------------------------------------------
# COLOR DEFINITIONS (ANSI ESCAPE CODES)
# ----------------------------------------------------------------------------
PURPLE='\033[0;35m'                # Purple color for terminal output
NC='\033[0m'                       # No Color - reset to default

# DIRCOLORS
if [ -f ~/.dircolors ]; then
    eval "$(dircolors -b ~/.dircolors)"
else
    eval "$(dircolors -b)"
fi

# ----------------------------------------------------------------------------
# PATH
# ----------------------------------------------------------------------------
export PATH="$PATH:~/code/tasks/bin/unix"
export PATH="$PATH:~/code/tasks/bin/unix/todo"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/home/leonc/go/bin"
export PATH="$PATH:/home/leonc/.ghcup/bin"

# ============================================================================
# SYSTEM MANAGEMENT
# ============================================================================

# ----------------------------------------------------------------------------
# SYSTEMD - System service manager
# ----------------------------------------------------------------------------
export sysd="/etc/systemd/system"  # Path to systemd service definition files
alias sysdr='sudo systemctl daemon-reload'
alias sysst='sudo systemctl start'
alias sysin='sudo systemctl status'
alias jctl='sudo journalctl'
alias s='systemctl'

# ============================================================================
# NAVIGATION & DIRECTORIES
# ============================================================================

# ----------------------------------------------------------------------------
# Navigation aliases
# ----------------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'

# ----------------------------------------------------------------------------
# File viewing and editing
# ----------------------------------------------------------------------------
alias ls='ls -Fa --color=auto --show-control-chars --group-directories-first'
alias z='zathura'
alias n='nvim'
alias v='nvim'
alias zj='zellij'

# ----------------------------------------------------------------------------
# Directory shortcuts
# ----------------------------------------------------------------------------
export cod='~/code'                                     # Main code directory
export cimp='~/cours/Cours_Imperial'                   # Imperial College coursework
export bkp='/mnt/backup'                                # Backup mount point
export pml='~/cours/Cours_Imperial/ML/Articles'        # Machine learning articles

# ============================================================================
# VERSION CONTROL
# ============================================================================

# ----------------------------------------------------------------------------
# GIT - Version control system
# ----------------------------------------------------------------------------
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
alias grb='git rebase -i'                   # to squash minor commits together
alias gcl='git config --list'
alias gconfig='git config --list --show-origin'

# ============================================================================
# PYTHON DEVELOPMENT
# ============================================================================

# ----------------------------------------------------------------------------
# UV - Python package and project manager
# ----------------------------------------------------------------------------
alias uva='source .venv/bin/activate'
alias uvs='uv sync'
alias uvb='uv build'
alias uvv='uv venv -p'

# ----------------------------------------------------------------------------
# RUFF - Python linter and formatter
# ----------------------------------------------------------------------------
alias rf='ruff format'

# ============================================================================
# RUST DEVELOPMENT
# ============================================================================

# ----------------------------------------------------------------------------
# RUSTUP - Rust toolchain manager
# ----------------------------------------------------------------------------
alias ru='rustup update'

# ----------------------------------------------------------------------------
# CARGO - Rust package manager and build tool
# ----------------------------------------------------------------------------
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

# Initialize Cargo environment
. "$HOME/.cargo/env"

# ============================================================================
# CONTAINER TOOLS
# ============================================================================

# ----------------------------------------------------------------------------
# PODMAN - Container management tool
# ----------------------------------------------------------------------------
alias pb='podman build'
alias pr='podman run'
alias pls='podman image ls'

# ============================================================================
# DOCUMENT PROCESSING
# ============================================================================

# ----------------------------------------------------------------------------
# TEX & PDF utilities
# ----------------------------------------------------------------------------
alias pdfu='pdfunite'

# ============================================================================
# NODE.JS DEVELOPMENT
# ============================================================================

# ----------------------------------------------------------------------------
# NPM - Node.js package manager
# ----------------------------------------------------------------------------
alias nps='npm start'
alias npi='npm install'
alias npp='npx prettier . -write'

# ----------------------------------------------------------------------------
# NVM - Node.js Version Manager
# ----------------------------------------------------------------------------
# Initialize NVM (manages multiple Node.js versions)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# ============================================================================
# OCAML DEVELOPMENT
# ============================================================================

# ----------------------------------------------------------------------------
# OPAM - OCaml package manager
# ----------------------------------------------------------------------------
# Initialize OPAM environment (sets PATH, MANPATH, OCAML_TOPLEVEL_PATH, etc.)
eval $(opam env)

# ============================================================================
# UTILITY FUNCTIONS
# ============================================================================

# Use 'declare -F' to list all functions
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

# ============================================================================
# TERMINAL & PROMPT CONFIGURATION
# ============================================================================

# ----------------------------------------------------------------------------
# STARSHIP - Modern shell prompt
# ----------------------------------------------------------------------------
export STARSHIP_CONFIG=~/.config/starship.toml  # Path to Starship configuration file

# ----------------------------------------------------------------------------
# DEBIAN CHROOT - Identify chroot environment
# ----------------------------------------------------------------------------
# Set variable identifying the chroot you work in (displayed in prompt)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# ----------------------------------------------------------------------------
# LESSPIPE - Enhanced file viewing with less
# ----------------------------------------------------------------------------
# Enable preprocessing of files before viewing with less (syntax highlighting, etc.)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ----------------------------------------------------------------------------
# PROMPT (PS1) - Command line prompt appearance
# ----------------------------------------------------------------------------
# Detect terminal color support
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Force color prompt if terminal supports it
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# Terminal has color support (Ecma-48/ISO/IEC-6429 compliant)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Set PS1 based on color support
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Set xterm window title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# ============================================================================
# FINAL INITIALIZATION
# ============================================================================

# Prepend .local/bin folder to PATH to prioritise over system binaries
. "$HOME/.local/bin/env"
# includes uv, uvx, harlequin, ...
