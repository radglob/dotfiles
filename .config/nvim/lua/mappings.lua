local telescope = require('telescope.builtin')

vim.g.mapleader = " "

map('n', '<C-H>', '<C-W><C-H>')
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<cr>')
map('n', '<leader>vr', ':luafile ~/.config/nvim/init.lua<cr>') 
map('n', '<leader>Q', ':bufdo bdelete<vr')
map('', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]])
map('', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]])
map('', '<leader>fs', [[<cmd>lua require('telescope.builtin').git_files()<cr>]])
map('', '<leader>ne', ':NERDTreeFocus<cr>')
map('', '<leader>nc', ':NERDTreeClose<cr>')
