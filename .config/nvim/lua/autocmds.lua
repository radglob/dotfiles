if vim.fn.has "nvim-0.7" then
  local api = vim.api

  -- Set filetype for prisma
  api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" },
    { pattern = "*.prisma", command = "set filetype=prisma" }
  )
end
