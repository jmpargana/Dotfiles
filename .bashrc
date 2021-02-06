########################################################################################
#
# ~/.bashrc 
#
# Author: Joao Pargana
#
# Requirements:
#   - exa
#   - fzf
#   - ripgrep
#   - fd  
#   - bat
#   - sd
#   - hub

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# [[ -z "$TMUX" ]] && exec tmux
if which tmux >/dev/null 2>&1; then
    test -z "$TMUX" && (tmux attach || tmux new-session)
fi


# setup path
PATH=$PATH:~/.local/bin
PATH=$PATH:~/go/bin
PATH=$PATH:~/.cargo/bin

alias vi=nvim
alias vim=nvim
alias n=nvim

# ALIASES
# basic colors
alias diff='diff --color=auto'
alias dmesg="dmesg --color=always"
alias ip="ip -color=auto"

# use colorful versions of cmd utilities if available
if type exa > /dev/null 2>&1; then
    alias ls="exa"
else
    alias ls="ls --color"
fi

if type rg > /dev/null 2>&1; then
    alias grep="rg"
else
    alias grep="grep --color=auto"
fi

if type bat > /dev/null 2>&1; then
    alias cat="bat"
fi

if type hub > /dev/null 2>&1; then
    alias git="hub"
fi


# editing
# if type nvim > /dev/null 2>&1; then
#     alias vim="nvim"
# fi

alias v="nvim"
alias vn="vim -u ~/.basic.vim"
alias vb='nvim ~/.bashrc'
alias sb="source ~/.bashrc"
alias sv="sudo vim"
alias vv="nvim ~/.vimrc"
alias vz="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
alias va="nvim ~/.config/alacritty/alacritty.yml"
alias vnt="vim -u NONE ~/.tmux.conf"
alias vt="nvim ~/.tmux.conf"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ll="exa -al"
alias lo="ls -o"
alias lh="ls -lh"
alias la="exa -a"
alias lt="exa -T"
alias lr="exa -R"

# ARCH
alias pac="sudo pacman -S"
alias pacr="sudo pacman -R"
alias ya="yay -S"
alias upt="yay -Syu --devel --timeupdate"
alias sss="sudo systemctl start"
alias sse="sudo systemctl enable"
alias open="xdg-open"

# WINDOW MANAGERS
alias i3c="vim ~/.config/i3/config"
alias obc="vim ~/.config/openbox/rc.xml"

# bind to functions
bind '"\C-g":"cd_with_fzf\n"'
bind '"\C-o":"open_with_fzf\n"'



# MOTIONS
alias gh="cd ~"
alias gp="cd ~/Documents/Personal"
alias gP="cd ~/Documents/ProgrammingLanguages"
alias gu="cd ~/Documents/Uni"
alias gt="cd ~/Documents/Testing"
alias gw="cd ~/Documents/Work"
alias gD="cd ~/Downloads"
alias gL="cd ~/Documents/Languages"
alias gk="cd ~/.KaliLinux"
alias gba="cd ~/Documents/Bachelorarbeit/AlexaStudyingAssistant"


# PROGRAMMING
# rust
alias cr="cargo run"
alias ci="cargo init"
alias ct="cargo test"
alias cdo="cargo doc --open"
alias cf="cargo fmt"
alias cws="cargo web start"
alias cn="cargo_new"
alias cnl="cargo_new_lib"


# python
alias py="python"
alias prp="pipenv run python"
alias pis="pipenv shell"
alias ppi="pipenv install"
alias pid="pipenv install --dev"
alias ppp="pipenv --python python"
alias pb="black"

# git
alias gaa="git add ."
alias gcm="git commit -m"
alias gpu="git push -u origin main"
alias gs="git status"
alias gc="git clone"

# js
alias ys="yarn start"
alias nt="npm test"
alias nps="npm start"
alias ni="npm i -S"

# docker
alias dr="docker run"
alias drm="docker rm"
alias drmv="docker rm -v"
alias dcr="docker create"
alias de="docker exec"
alias dps="docker ps"
alias di="docker images"
alias ds="docker search"
alias dp="docker pull"

# go
alias gi="go install"
alias gb="go build"
alias gr="go run"
alias gf="go fmt"
alias gd="go doc"


# ssh toggler
alias sssh="sudo systemctl start sshd.service"
alias stssh="sudo systemctl stop sshd.service"


# kali
alias kali="docker run -ti --rm \
    -v  type=bindsrc=/home/icm/.KaliLinux/Pentest/root,dst=/root \
    -v  type=bindsrc=/home/icm/.KaliLinux/Pentest/postgresqldst=/var/lib/postgresql \
    kali \
    bash"



# EXTRAS
alias n="neofetch"
alias s="sensors"
alias nv="nvidia-smi"
alias p="ping 8.8.8.8 -c 3"
alias ns="nordvpn status"
alias nus="nordvpn c us"
alias rmd="rm -d"
alias rmf="rm -rf"
alias cx="chmod +x"
alias sa="systemd-analyze"
alias sab="systemd-analyze blame"


# Colors
COLOR_NC='\e[0m' # No Color
COLOR_WHITE='\e[1;37m'
COLOR_BLACK='\e[0;30m'
COLOR_BLUE='\e[0;34m'
COLOR_LIGHT_BLUE='\e[1;34m'
COLOR_GREEN='\e[0;32m'
COLOR_LIGHT_GREEN='\e[1;32m'
COLOR_CYAN='\e[0;36m'
COLOR_LIGHT_CYAN='\e[1;36m'
COLOR_RED='\e[0;31m'
COLOR_LIGHT_RED='\e[1;31m'
COLOR_PURPLE='\e[0;35m'
COLOR_LIGHT_PURPLE='\e[1;35m'
COLOR_BROWN='\e[0;33m'
COLOR_YELLOW='\e[1;33m'
COLOR_GRAY='\e[0;30m'
COLOR_LIGHT_GRAY='\e[0;37m'

# ENV
# PS1='\e[33;1m\u@\h: \e[31m\W\e[0m\$ '
PS1='\['"$COLOR_LIGHT_CYAN"'\]\u@\['"$COLOR_LIGHT_GREEN"'\]\h \['"$COLOR_LIGHT_RED"'\]\W\[\e[0m\]\$ '
PS2='> '
# PS1="$TITLEBAR\n\[${UC}\]\u \[${COLOR_LIGHT_BLUE}\]\${PWD} \[${COLOR_BLACK}\]\$(vcprompt) \n\[${COLOR_LIGHT_GREEN}\]→\[${COLOR_NC}\] "  
# LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'


export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     
export LESS_TERMCAP_md=$'\E[1;36m'    
export LESS_TERMCAP_me=$'\E[0m'      
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'      
export LESS_TERMCAP_us=$'\E[1;32m'  
export LESS_TERMCAP_ue=$'\E[0m'    

# fzf vars
export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs"


# include .files when globbing
shopt -s dotglob
# fix spelling errors for cd
shopt -s cdspell

bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set bell-style none" # no bell
# bind "set show-all-if-ambiguous On" # show list automatically, without double tab




# quick backup
bu () { cp $1 ~/.backup/`basename $1`-`date +%Y%m%d%H%M`.backup ;  }

# change builtin cd to list directories after being called
cd() {
    if [ -n "$1" ]; then
        builtin cd "$@" && ls --group-directories-first
    else
        builtin cd ~ && ls --group-directories-first
    fi
}

# beautiful script to extract files according to format
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xvjf $1    ;;
			*.tar.gz)    tar xvzf $1    ;;
			*.tar.xz)    tar xf $1    ;;
			*.bz2)       bunzip2 $1     ;;
			*.rar)       unrar x $1       ;;
			*.gz)        gunzip $1      ;;
			*.tar)       tar xvf $1     ;;
			*.tbz2)      tar xvjf $1    ;;
			*.tgz)       tar xvzf $1    ;;
			*.zip)       unzip $1       ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1        ;;
			*)           echo "don't know how to extract '$1'..." ;;
		esac
	else
		echo "'$1' is not a valid file!"
	fi
}


# go up n directories instead of ../../..
up(){
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++)) do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}


# print given column from pipeline
fawk() {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}


# alias for sudo or sudo last command
s() {
    if [[ $# == 0 ]]; then
        sudo $(history -p '!!')
    else
        sudo "$@"
    fi
}


# ripgrep fzf
rgf() {
    RG_PREFIX="rg --files-with-matches"
}

# really powerfull navigation command
open_with_fzf() {
    fd -t f -H -I | fzf -m --preview="bat --color=always --style=numbers --line-range :500 {}" | xargs -ro -d "\n" xdg-open 2>&- 
}

# move to any directory and show tree
cd_with_fzf() {
        builtin cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview")"
}

pacs() {
    sudo pacman -S $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --bind=space:toggle-preview | xargs)
}


# rga-fzf() {
# 	RG_PREFIX="rga --files-with-matches"
# 	local file
# 	file="$(
# 		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
# 			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
# 				--phony -q "$1" \
# 				--bind "change:reload:$RG_PREFIX {q}" \
# 				--preview-window="70%:wrap"
# 	)" &&
# 	echo "opening $file" &&
# 	xdg-open "$file"
# }


mkcd() {
    if [ ! -n "$1" ]; then
        echo "Enter a directory name"
    elif [ -d $1 ]; then
        echo "$1"' already exists' 
    else
        mkdir -p $1 && cd $1
    fi
}

cargo_new() {
    if [ ! -n "$1" ]; then
        "Enter a project name"
    elif [ -d $1 ]; then
        echo "$1"' already exists'
    else
        cargo new $1 && cd $1
    fi
}



cargo_new_lib() {
    if [ ! -n "$1" ]; then
        "Enter a project name"
    elif [ -d $1 ]; then
        echo "$1"' already exists'
    else
        cargo new --lib $1 && cd $1
    fi
}


# Kill Process allows you to select as many processes from fzf as you want with
# the TAB key and enter will kill them by ID number.
kp() {
    local pid=$(ps -ef | sed 1d | eval "fzf -m --header='[kill:process]'" | awk '{print $2}')

    if [ "x$pid" != "x" ]; then
        echo $pid | xargs kill -${1:-9}
    fi
}


_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}


ass() {
    name="${1}"
    base="$(basename ${name} .nasm)"
    base="$(basename ${base} .asm)"
    yasm -f elf64 -g dwarf2 -l "${base}".lst "${name}" 
    ld "${base}".o -o "${base}"
}


# _fzf_setup_completion path ag git kubectl dir tree rg


export EDITOR=nvim
export VISUAL=nvim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
