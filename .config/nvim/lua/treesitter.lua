local ts = require('nvim-treesitter.configs')
ts.setup { 
  ensure_installed = { 'ruby', 'elixir', 'eex', 'heex', 'javascript', 'css', 'typescript', 'tsx', 'gdscript' }, 
  highlight = { enable = true },
  indent = { enable = true }
}
