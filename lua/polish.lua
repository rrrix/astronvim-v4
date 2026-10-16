-- Post-setup customizations, run after lazy.nvim has loaded every plugin spec.
-- Highlight overrides live in lua/plugins/astroui.lua so they survive colorscheme reloads.

-- Markdown: clear the filetype-provided indentexpr so typing never auto-reindents lines.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function() vim.bo.indentexpr = "" end,
})

return {}
