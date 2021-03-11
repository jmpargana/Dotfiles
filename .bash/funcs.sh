
# Make dir and cd into it
mkcd() {
    if [ ! -n "$1" ]; then
        echo "Enter a directory name"
    elif [ -d $1 ]; then
        echo "$1"' already exists'
    else
        mkdir -p $1 && cd $1
    fi
}

# quick backup
bu () { cp $1 ~/.backup/`basename $1`-`date +%Y%m%d%H%M`.backup ;  }


# Run ls after cd
cd() {
    if [ -n "$1" ]; then
        builtin cd "$@" && ls --group-directories-first
    else
        builtin cd ~ && ls --group-directories-first
    fi
}


# Extract according to filetype
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xvjf $1    ;;
			*.tar.gz)    tar xvzf $1    ;;
			*.bz2)       bunzip2 $1     ;;
			*.rar)       unrar x $1       ;;
			*.gz)        gunzip $1      ;;
			*.tar)       tar xvf $1     ;;
			*.tbz2)      tar xvjf $1    ;;
			*.tgz)       tar xvzf $1    ;;
			*.zip)       unzip $1       ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1        ;;
			*)           echo "don't know how to extract '$1'..." ;;
		esac
	else
		echo "'$1' is not a valid file!"
	fi
}


# Go n directories up
up(){
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++)) do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}


# Print nth column
fawk() {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}


# Sudo or sudo last command
s() {
    if [[ $# == 0 ]]; then
        sudo $(history -p '!!')
    else
        sudo "$@"
    fi
}


# Navigate from ~
cd_with_fzf() {
    builtin cd $HOME && cd "$(fd -I -t d | fzf --preview="tree -L 2 {}")"
}


# Open with fzf
open_with_fzf() {
    fd -t f -H -I | fzf -m --preview='bat --color=always --theme="OneHalfLight" --style=numbers --line-range :500 {}' | xargs -ro -d "\n" xdg-open 2>&-
}


# Pacman search and install
pacs() {
    sudo pacman -S $(pacman -Ssq | fzf -m --preview="pacman -Si {}" | xargs)
}

# Cargo create and cd
cargo_new() {
    if [ ! -n "$1" ]; then
        "Enter a project name"
    elif [ -d $1 ]; then
        echo "$1"' already exists'
    else
        cargo new $1 && cd $1
    fi
}

# Cargo create and cd lib
cargo_new_lib() {
    if [ ! -n "$1" ]; then
        "Enter a project name"
    elif [ -d $1 ]; then
        echo "$1"' already exists'
    else
        cargo new --lib $1 && cd $1
    fi
}

