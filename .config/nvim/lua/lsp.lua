local lsp = require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')
local mapping = require('cmp.config.mapping')
local cmp = require('cmp')
local types = require('cmp.types')
local cmp_lsp = require('cmp_nvim_lsp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' }
  }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_lsp.update_capabilities(capabilities)

lsp.elixirls.setup {
  cmd = {"$HOME/bin/elixir-ls/language_server.sh"},
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    elixirLS = {
      fetchDeps = false
    }
  }
}

lsp_installer.setup{}

-- Having issues with Rubocop or whatever with a Rails app (or something else using bundler?
-- Check ~/.cache/nvim/lsp.log and use `specific_install` to add any gems you might need.
lsp.solargraph.setup {
  cmd = { "solargraph", "stdio" }
}

lsp.html.setup {
  capabilities = capabilities
}

lsp.cssls.setup {
  capabilities = capabilities
}

lsp.tsserver.setup{}

lsp.hls.setup{}

lsp.tailwindcss.setup{}

lsp.prismals.setup{}

map('n', '<leader>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<leader>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')
