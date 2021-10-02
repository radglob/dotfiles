local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt
local fn = vim.fn

require('paq') {
  'savq/paq-nvim';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';
  'tpope/vim-surround';
  'tpope/vim-fugitive';
  'overcache/NeoSolarized';

  -- Elixir-specific.
  'elixir-editors/vim-elixir';

  -- Python-specific.
  'Vimjas/vim-python-pep8-indent';

  -- Clojure-specific.
  'clojure-vim/clojure.vim';
  'guns/vim-sexp';
  'tpope/vim-sexp-mappings-for-regular-people';
  'junegunn/rainbow_parentheses.vim';

  'neovim/nvim-lspconfig';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-buffer';
  'hrsh7th/nvim-cmp';

  -- Treesitter support
  'nvim-treesitter/nvim-treesitter';
}

function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('settings')
require('mappings')
require('spotify')
require('treesitter')
require('lsp')
require('telescope-setup')

