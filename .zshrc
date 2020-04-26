# extend PATH for python binaries
path+=('/home/icm/.local/bin')
path+=('/home/icm/.cargo/bin')
path+=('/opt/android-sdk/tools/bin')
path+=('/opt/android-sdk/tools')
path+=('/home/icm/.bin')
export PATH

export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_HOME=/opt/android-sdk
export CHROME_EXECUTABLE=/sbin/chromium

# Path to your oh-my-zsh installation.
export ZSH="/home/icm/.oh-my-zsh"

ZSH_THEME="sunrise"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


[[ $TMUX = "" ]] && export TERM="xterm-256color"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export ARCHFLAGS="-arch x86_64"


# EDITOR SHORTCUTS
alias ec="emacsclient -t"
alias ez="ec ~/.zshrc"
alias einit="ec ~/.emacs.d/org-init.org"
alias sv="sudo vim"


# EDITING
alias vv="vim ~/.vimrc"
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"


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


# run ls after cd
function chpwd() {
	emulate -L zsh
	ls
}


function mkcd () {
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
