local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt
local fn = vim.fn

require('paq') {
  -- Keep paq up-to-date with paq
  'savq/paq-nvim';

  -- Theme
  'savq/melange';
  'ojroques/nvim-hardline';

  -- nvim-cmp
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/nvim-cmp';
  'hrsh7th/cmp-path';
  'hrsh7th/cmp-cmdline';

  -- nvim-cmp snippets
  'hrsh7th/cmp-vsnip';
  'hrsh7th/vim-vsnip';

  -- LSP
  { 'williamboman/mason.nvim', build = function() cmd 'MasonUpdate' end };
  'williamboman/mason-lspconfig.nvim';
  'neovim/nvim-lspconfig';
  'jose-elias-alvarez/null-ls.nvim';
  {'nvim-treesitter/nvim-treesitter', build = function() cmd 'TSUpdate' end };

  -- fzf (telescope is too slow :( )
  {'junegunn/fzf', build = 'fzf#install()' };
  'junegunn/fzf.vim';

  'kyazdani42/nvim-web-devicons';

  -- Language support and niceties.
  'sheerun/vim-polyglot';
  'tpope/vim-commentary';
  'tpope/vim-abolish';
  'tpope/vim-fugitive';
  'tpope/vim-rails';
  'tpope/vim-surround';
}

function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('hardline').setup{}
require('settings')
require('mappings')
require('treesitter')
require('lsp')
