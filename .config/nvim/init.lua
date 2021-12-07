local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt
local fn = vim.fn

require('paq') {
  {'dracula/vim', as = "dracula"};
  'folke/lua-dev.nvim';
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-vsnip';
  'hrsh7th/nvim-cmp';
  'hrsh7th/vim-vsnip';
  'neovim/nvim-lspconfig';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';
  'nvim-treesitter/nvim-treesitter';
  'savq/paq-nvim';
  'sheerun/vim-polyglot';
  'tpope/vim-commentary';
  'tpope/vim-fugitive';
  'tpope/vim-surround';
  'vim-airline/vim-airline';
  'vim-airline/vim-airline-themes';
}

function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('settings')
require('mappings')
require('treesitter')
require('lsp')
require('telescope-setup')

