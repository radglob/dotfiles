if vim.fn.has "nvim-0.7" then
  local api = vim.api

  -- Set filetype for gdscript
  api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" },
    { pattern = "*.gd", command = "set filetype=gdscript" }
  )

  
end
