
# ALIASES
# basic
alias diff='diff --color=auto'
alias dmesg="dmesg --color=always"
alias ip="ip -color=auto"
alias open="xdg-open"
alias ipa="ip addr show"
alias bat='bat --color=always --theme="OneHalfLight" --style=numbers'
# alias vim="nvim"
alias vi="nvim"

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# use colorful versions of cmd utilities if available
if type exa > /dev/null 2>&1; then
    alias ls="exa"
else
    alias ls="ls --color"
fi

alias grep="grep --color=auto"

# editing
alias vb='vi ~/.bashrc'
alias sb="source ~/.bashrc"
alias va="vim ~/.config/alacritty/alacritty.yml"
alias sv="sudo vim"




alias p="ping 8.8.8.8 -c 3"
alias rmd="rm -d"
alias rmf="rm -rf"
alias cx="chmod +x"

