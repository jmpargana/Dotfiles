####################################################################################
#
# jmpargana's bashrc - requirements: fzf, ripgrep, fd, bat, exa
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


# Source all bash config files
[ -f "$HOME/.bash/funcs.sh" ] && source $HOME/.bash/funcs.sh
[ -f "$HOME/.bash/settings.sh" ] && source $HOME/.bash/settings.sh

# binds
bind '"\C-g":"cd_with_fzf\n"'
bind '"\C-o":"open_with_fzf\n"'

# Load aliases
[ -f "$HOME/.bash_aliases" ] && source $HOME/.bash_aliases
[ -d "$HOME/.cargo" ] && source "$HOME/.cargo/env"

# External dependencies
[ -d "/usr/share/fzf" ] && source /usr/share/fzf/key-bindings.bash
[ -d "/usr/share/fzf" ] && source /usr/share/fzf/completion.bash
[ -d "/usr/share/nvm" ] && source /usr/share/nvm/init-nvm.sh
