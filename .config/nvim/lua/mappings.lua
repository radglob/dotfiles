local telescope = require('telescope.builtin')

map('n', '<C-H>', '<C-W><C-H>')
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-L>', '<C-W><C-L>')
map('', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]])
map('', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]])
map('', '<leader>fs', [[<cmd>lua require('telescope.builtin').git_files()<cr>]])
