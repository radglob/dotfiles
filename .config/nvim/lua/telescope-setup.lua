require('telescope').setup {
  defaults = {
    file_ignore_patterns = { ".*min.js.*", "node_modules" },
  },
  pickers = {
    find_files = {
      no_ignore_parent = true,
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/snapshots/*" }
    },
    live_grep = {
      additional_args = function(opts)
        return {"--hidden"}
      end
    }
  }
}

require('telescope').load_extension "file_browser"

