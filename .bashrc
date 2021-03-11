####################################################################################
#
# icm's bashrc - requirements: fzf, ripgrep, fd, bat, exa
#
####################################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Launch tmux
 if [[ $DISPLAY ]]; then
    if which tmux >/dev/null 2>&1; then
        test -z "$TMUX" && (tmux attach || tmux new-session)
    fi
fi

# Use exa if available
if type exa > /dev/null 2>&1; then
    alias ls="exa"
else
    alias ls="ls --color"
fi


# Path
export GOPATH=$HOME/go
export PATH=$PATH:~/.cargo/bin              # rust binaries
export PATH=$PATH:~/.local/bin              # python binaries
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin   # go binaries
export PATH=/home/icm/.bin:$PATH

export TERM="screen-256color"

export FZF_DEFAULT_COMMAND="rg --files --hidden"


# Source all bash config files
[ -f "$HOME/.bash/funcs.sh" ] && source $HOME/.bash/funcs.sh
[ -f "$HOME/.bash/settings.sh" ] && source $HOME/.bash/settings.sh


# Load aliases
[ -f "$HOME/.bash_aliases" ] && source $HOME/.bash_aliases


# binds
bind '"\C-g":"cd_with_fzf\n"'
bind '"\C-o":"open_with_fzf\n"'


[ -d "$HOME/.cargo" ] && source "$HOME/.cargo/env"


# External dependencies
[ -d "/usr/share/fzf" ] && source /usr/share/fzf/key-bindings.bash
[ -d "/usr/share/fzf" ] && source /usr/share/fzf/completion.bash
[ -d "/usr/share/nvm" ] && source /usr/share/nvm/init-nvm.sh
