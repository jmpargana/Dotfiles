#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Path
export GOPATH=$HOME/go
export PATH=$PATH:~/.cargo/bin              # rust binaries
export PATH=$PATH:~/.local/bin              # python binaries
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin   # go binaries
export PATH=/home/icm/.bin:$PATH

export KUBECONFIG=$HOME/.kube/config

export TERM=tmux-256color

export TERMINAL=alacritty

export FZF_DEFAULT_COMMAND="rg --files --hidden"
export EDITOR=nvim
export VISUAL=nvim
