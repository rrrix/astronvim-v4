-- This is a test
-- Also a test
vim.api.nvim_set_hl(0, "Comment", { fg = "#ff9900" })
vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function() vim.bo.indentexpr = "" end,
})

return {}
