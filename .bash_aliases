###############################################
#
#             ALIASES
#
###############################################

# basic
alias diff='diff --color=auto'
alias dmesg="dmesg --color=always"
alias ip="ip -color=auto"
alias open="xdg-open"
alias ipa="ip addr show"
alias bat='bat --color=always --theme="OneHalfLight" --style=numbers'
alias vi="nvim"

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


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



# ARCH
alias pac="sudo pacman -S"
alias pacr="sudo pacman -R"
alias ya="yay -S"
alias upt="yay -Syu --devel --timeupdate"
alias sss="sudo systemctl start"
alias sse="sudo systemctl enable"
alias ssr="sudo systemctl restart"
alias ssd="sudo systemctl disable"
alias sst="sudo systemctl stop"




# navigation -> up() function is also very powerful
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ll="ls -l"
alias lo="ls -o"
alias lh="ls -lh"
alias la="ls -a"
alias lal="ls -la"


# MOTIONS
alias gp="cd ~/Documents/Personal"
alias gP="cd ~/Documents/ProgrammingLanguages"
alias gt="cd ~/Documents/Testing"
alias gw="cd ~/Documents/Work"
alias gD="cd ~/Downloads"




# PROGRAMMING
# rust
alias cr="cargo run"
alias ci="cargo init"
alias ct="cargo test"
alias cn="cargo new"
alias cdo="cargo doc --open"
alias cf="cargo fmt"
alias cn="cargo_new"
alias cnl="cargo_new_lib"


# python
alias py="python"
alias prp="pipenv run python"
alias pis="pipenv shell"
alias ppi="pipenv install"
alias pid="pipenv install --dev"
alias ppp="pipenv --python python"


# git
alias gaa="git add ."
alias gcm="git commit -m"
alias gpu="git push -u origin HEAD"
alias gs="git status"
alias gc="git commit"
alias gb="git branch"
alias gck="git checkout"


# js
alias ys="yarn start"
alias nt="npm test"
alias nps="npm start"
alias ni="npm i -S"
alias yc="yarn compile"
alias yb="yarn build"
alias yt="yarn test"
alias ytu="yarn test:unit"


# docker
alias dr="docker run"
alias drir="docker run -it --rm"
alias drm="docker rm"
alias drmv="docker rm -v"
alias dcr="docker create"
alias de="docker exec"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias di="docker images"
alias ds="docker search"
alias dp="docker pull"


# go
alias gb="go build"
alias gr="go run"
alias gf="go fmt"
alias gd="go doc"
alias gi="go install"

