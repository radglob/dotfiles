local o = vim.opt
local g = vim.g
local cmd = vim.cmd
-- Global editor configs.
o.autoindent = true
o.cursorline = false
o.expandtab = true
o.foldenable = false
o.hidden = true
o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.laststatus = 2
o.list = true
o.listchars = { space = '·' }
o.modeline = true
o.relativenumber = true
o.number = true
o.shiftwidth = 2
o.scrolloff = 8
o.sidescrolloff = 8
o.softtabstop = 2
o.splitbelow = true
o.splitright = true
o.tabstop = 2
o.termguicolors = true
g.airline_powerline_fonts = 1

-- Set background by time of day.
time = os.date("*t")
if time.hour > 18 then
  o.background = 'dark'
else
  o.background = 'light'
end

cmd("syntax on")
cmd("colorscheme melange")

stl = require('statusline.line')
o.statusline = '%!luaeval("stl.statusline()")'

