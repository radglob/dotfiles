local ts = require('nvim-treesitter.configs')
ts.setup { 
  ensure_installed = { 'ruby', 'elixir', 'heex', 'haskell', 'javascript', 'css', 'typescript', 'tsx' }, 
  highlight = { enable = true },
  indent = { enable = true }
}
