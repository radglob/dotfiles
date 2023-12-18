vim.g.mapleader = " "

-- Buffer navigation
map('n', '<C-H>', '<C-W><C-H>')
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-L>', '<C-W><C-L>')

-- Configuration
map('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<cr>')
map('n', '<leader>vr', ':luafile ~/.config/nvim/init.lua<cr>')

-- Clear all buffers.
map('n', '<leader>Q', ':bufdo bdelete<cr>')

-- Telescope keybindings.
map('', '<leader>ff', ':Files<cr>')
map('', '<leader>fg', ':Rg<cr>')
map('', '<leader>fv', ':GFiles<cr>')
map('', '<leader>fb', ':Buffers<cr>')
map('', '<leader>x', ':!open %<cr>')

-- Escape terminal mode
map('t', '<ESC>', '<C-\\><C-N>:q!<cr>')
