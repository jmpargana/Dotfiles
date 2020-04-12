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

alias ec="emacsclient -t"
alias ez="ec ~/.zshrc"
alias einit="ec ~/.emacs.d/org-init.org"
alias sv="sudo vim"
alias sz="source ~/.zshrc"
alias i3c="ec ~/.config/i3/config"
alias pac="sudo pacman -S"
alias ya="yay -S"
alias upt="sudo pacman -Syyu"
alias yupt="yay -Syu"
alias vv="vim ~/.vimrc"
alias vz="vim ~/.zshrc"
alias n="neofetch"
alias s="sensors"
alias nv="nvidia-smi"
alias mr="cd .. && make && cd bin && ./*"
alias cr="cargo run"
alias ci="cargo init"
alias prp="pipenv run python"
alias ns="nordvpn status"
alias p="ping 8.8.8.8 -c 3"
alias ct="cargo test"
alias cn="cargo new"
alias cdo="cargo doc --open"
alias gaa="git add ."
alias gcm="git commit -m"
alias gpu="git push -u origin master"
alias cf="cargo fmt"
alias cws="cargo web start"
alias gs="git status"
alias ys="yarn start"
alias nus="nordvpn c us"

# run ls after cd
function chpwd() {
	emulate -L zsh
	ls
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
