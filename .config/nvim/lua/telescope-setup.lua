require('telescope').setup {
  defaults = {
    file_ignore_patterns = { ".*min.js.*", "node_modules" },
  },
  pickers = {
    find_files = {
      no_ignore_parent = true
    },
    live_grep = {
      additional_args = function(opts)
        return {"--hidden"}
      end
    }
  }
}

