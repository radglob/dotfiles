local ts = require('nvim-treesitter.configs')
ts.setup { 
  ensure_installed = { 'ruby', 'elixir', 'haskell', 'javascript', 'css', 'typescript', 'prisma' }, 
  highlight = { enable = true }
}
