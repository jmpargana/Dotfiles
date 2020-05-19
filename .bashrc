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

LESS=-R
LESS_TERMCAP_mb=$'\E[1;31m'     
LESS_TERMCAP_md=$'\E[1;36m'    
LESS_TERMCAP_me=$'\E[0m'      
LESS_TERMCAP_so=$'\E[01;44;33m'
LESS_TERMCAP_se=$'\E[0m'      
LESS_TERMCAP_us=$'\E[1;32m'  
LESS_TERMCAP_ue=$'\E[0m'    



cd() {
    if [ -n "$1" ]; then
        builtin cd "$@" && ls --group-directories-first
    else
        builtin cd ~ && ls --group-directories-first
    fi
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
