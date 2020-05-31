#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# ALIASES
# basic
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep="grep --color=auto"
alias dmesg="dmesg --color=always"
alias ip="ip -color=auto"

# editing
alias vb='vim ~/.bashrc'
alias sb="source ~/.bashrc"
alias sv="sudo vim"
alias vv="vim ~/.vimrc"
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ll="ls -l"
alias lo="ls -o"
alias lh="ls -lh"
alias la="ls -la"

# ARCH
alias pac="sudo pacman -S"
alias ya="yay -S"
alias upt="sudo pacman -Syyu"
alias yupt="yay -Syu"

# WINDOW MANAGERS
alias i3c="ec ~/.config/i3/config"

# MOTIONS
alias gh="cd ~"
alias gp="cd ~/Documents/Personal"
alias gP="cd ~/Documents/ProgrammingLanguages"
alias gu="cd ~/Documents/Uni"
alias gt="cd ~/Testing"
alias gw="cd ~/Documents/Work"
alias gD="cd ~/Downloads"
alias gL="cd ~/Documents/Languages"
alias gk="cd ~/.KaliLinux"


# PROGRAMMING
# rust
alias cr="cargo run"
alias ci="cargo init"
alias ct="cargo test"
alias cn="cargo new"
alias cdo="cargo doc --open"
alias cf="cargo fmt"
alias cws="cargo web start"

# python
alias py="python"
alias prp="pipenv run python"
alias pis="pipenv shell"
alias ppi="pipenv install"
alias pid="pipenv install --dev"
alias ppp="pipenv --python python"
alias b="black"

# git
alias gaa="git add ."
alias gcm="git commit -m"
alias gpu="git push -u origin master"
alias gs="git status"

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

# go
alias gb="go build"
alias gr="go run"
alias gf="go fmt"
alias gd="go doc"

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



# ENV
PS1='\e[33;1m\u@\h: \e[31m\W\e[0m\$ '
# PS1=$COLOR_YELLOW'\u@\h: '$COLOR_LIGHT_RED'\W\e[0m\$ '
PS2='> '
# PS1="$TITLEBAR\n\[${UC}\]\u \[${COLOR_LIGHT_BLUE}\]\${PWD} \[${COLOR_BLACK}\]\$(vcprompt) \n\[${COLOR_LIGHT_GREEN}\]→\[${COLOR_NC}\] "  
# LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'


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

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     
export LESS_TERMCAP_md=$'\E[1;36m'    
export LESS_TERMCAP_me=$'\E[0m'      
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'      
export LESS_TERMCAP_us=$'\E[1;32m'  
export LESS_TERMCAP_ue=$'\E[0m'    


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


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
