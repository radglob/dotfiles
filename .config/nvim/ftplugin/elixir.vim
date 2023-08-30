set tabstop=2
set softtabstop=2
set expandtab
autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
