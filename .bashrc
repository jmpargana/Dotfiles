####################################################################################
#
# bashrc
#
# Author: Joao Pargana
# 
# Requirements:
#   - fzf
#   - rg
#   - fd
#   - bat
#   - exa

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# launch tmux only on graphical environment and check if no session is started
 # if [[ $DISPLAY ]]; then
#     if which tmux >/dev/null 2>&1; then
#         test -z "$TMUX" && (tmux attach || tmux new-session)
#     fi
# fi


# Source all bash config files
for f in $HOME/.bash; do [[ -f "$f" ]] && . "$f"; done


[ -d "$HOME/.cargo" ] && source "$HOME/.cargo/env"


# External dependencies
[ -d "/usr/share/fzf" ] && source /usr/share/fzf/key-bindings.bash
[ -d "/usr/share/fzf" ] && source /usr/share/fzf/completion.bash
[ -d "/usr/share/nvm" ] && source /usr/share/nvm/init-nvm.sh
