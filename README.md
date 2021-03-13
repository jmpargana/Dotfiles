# Dotfiles

This repository holds all the configuration files I've gathered and changed 
since my early days of linux.


## Config

There are three main files and folders that define my workflow:

- [neovim](.config/nvim)
- [bash](.bashrc)
- [tmux](.tmux.conf)

To have the expected behaviour, install the following packages:

```bash
# Use your package manager
sudo pacman -S fzf ripgrep fd exa bat

# Run this inside neovim (make sure you are running v0.5+)
:PlugInstall
:CocUpdateSync
```


## Extra

The [extra](.extra) folder holds multiple other configs that are either no longer used
or alternatives to the three main ones above mentioned.

### Singlefile

This folder contains a single file version of what I might need to load quickly
in a different machine:

- bash
- vim (plain vim v8+)


### Alternatives

These are configurations that could replace my current workflow. Either using a
different shell like _zsh_ or _fish_, or using a _neovim_ configured with *lua*
and the builtin lsp.

- [zshrc](.extra/alternatives/zshrc)
- [fish](.extra/alternatives/fish)
- [neovim](.extra/alternatives/nvim) (completely written in lua using the builtin lsp)
- [ranger](.extra/alternatives/ranger)


### Deprecated

In this folder are configs of programs I've stopped using, like:

- [emacs](.extra/deprecated/emacs)
- [Xresources](.extra/deprecated/Xresources) (for xterm and urxvt)
- [i3](.extra/deprecated/i3)
- [Openbox](.extra/deprecated/openbox)
- [Awesome WM](.extra/deprecated/awesome)


## Guides

- [Arch Linux Installation Guide](.guides/arch-installation.md)


## Scripts

- [Arch Linux Installation Script](.scripts/basic-install.sh) (incomplete)
