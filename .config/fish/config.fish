set -g -x fish_greeting ''
set -g -x PATH ~/.cargo/bin ~/.local/bin $PATH
set -g -x PATH ~/Android/Sdk/tools/bin $PATH
set -g -x PATH /var/lib/snapd/snap/bin $PATH
set -g -x PATH ~/Android/Sdk/tools $PATH
set -g -x PATH ~/Android/Sdk/emulator $PATH
set -g -x PATH ~/go/bin $PATH


# EDITOR SHORTCUTS
alias ec="emacsclient -t"
alias ez="ec ~/.zshrc"
alias einit="ec ~/.emacs.d/org-init.org"
alias sv="sudo vim"


# EDITING
alias vv="vim ~/.vimrc"
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias vf="vim ~/.config/fish/config.fish"
alias sf="source ~/.config/fish/config.fish"
alias vg="vim ~/.gitignore"


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
alias gt="cd ~/Documents/Testing"
alias gw="cd ~/Documents/Work"
alias gD="cd ~/Downloads"
alias gL="cd ~/Documents/Languages"
alias gk="cd ~/.KaliLinux/"
alias gba="cd ~/Documents/Bachelor/app"


# PROGRAMMING
# cpp
alias mr="cd .. && make && cd bin && ./*"

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
alias gr="go run"
alias got="go test"
alias gb="go build"
alias gf="go fmt"

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


function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and ls
    else
        builtin cd ~; and ls
    end
end

function mkcd
    mkdir -p $argv; and cd $argv
end
