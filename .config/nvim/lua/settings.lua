local o = vim.opt
local g = vim.g
local cmd = vim.cmd

-- Global editor configs.
o.autoindent = true
o.background = 'dark'
o.cursorline = false
o.expandtab = true
o.foldenable = false
o.hidden = true
o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.laststatus = 2
o.modeline = true
o.number = true
o.shiftwidth = 2
o.softtabstop = 2
o.splitbelow = true
o.splitright = true
o.tabstop = 2
o.termguicolors = true

cmd("syntax on")
cmd("colorscheme monokai_pro")

