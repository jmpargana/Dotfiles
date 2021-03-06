vim.cmd [[packadd packer.nvim]]

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

-- Clone packer on start if not found
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end


-- List of all plugins
return require('packer').startup(function()
  -- Self maintained
  use {'wbthomason/packer.nvim', opt = true}

  -- Theme
  use 'jacoborus/tender.vim'

  -- Editing
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'jiangmiao/auto-pairs'

  -- Navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- IDE
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'

  -- Syntax Highlighing and more
  use 'nvim-treesitter/nvim-treesitter'

  -- Snippets
  use 'mattn/emmet-vim'
end)
