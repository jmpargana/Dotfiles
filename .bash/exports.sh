
# path 
export GOPATH=$HOME/go
export PATH=$PATH:~/.cargo/bin              # rust binaries
export PATH=$PATH:~/.local/bin              # python binaries
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin   # go binaries
export PATH=/home/icm/.bin:$PATH

export TERM="screen-256color"


export EDITOR=vim
export VISUAL=vim


# LESS COLORS
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     
export LESS_TERMCAP_md=$'\E[1;36m'    
export LESS_TERMCAP_me=$'\E[0m'      
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'      
export LESS_TERMCAP_us=$'\E[1;32m'  
export LESS_TERMCAP_ue=$'\E[0m'    

export FZF_DEFAULT_COMMAND="rg --files"
