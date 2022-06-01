local telescope = require('telescope.builtin')

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
map('', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]])
map('', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]])
map('', '<leader>fv', [[<cmd>lua require('telescope.builtin').git_files()<cr>]])
map('', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]])
map('', '<leader>fs', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]])
map('', '<leader>jl', [[<cmd>lua require('telescope.builtin').jumplist()<cr>]])
map('', '<leader>x', ':!open %<cr>')

-- Escape terminal mode
map('t', '<ESC>', '<C-\\><C-N>')
