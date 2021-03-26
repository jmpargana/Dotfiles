

if [ -z $DISPLAY ] && [ "$(tty)" == "/dev/tty1" ]; then
    . $HOME/.bash_profile
    exec sway
fi
