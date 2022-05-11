local ts = require('nvim-treesitter.configs')
ts.setup { 
  ensure_installed = { 'ruby', 'elixir', 'haskell', 'javascript', 'css', 'typescript', 'tsx', 'prisma' }, 
  highlight = { enable = true },
  indent = { enable = false }
}
