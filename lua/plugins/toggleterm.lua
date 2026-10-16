-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize toggleterm: size splits relative to the editor instead of fixed rows/columns.
-- AstroNvim core already provides `on_create` (window-local fold/sign columns and the
-- <C-'>/<F7> toggle keys), so only `size` is overridden here.

--- Compute terminal size from the current editor dimensions.
---@param term Terminal
---@return number size rows for horizontal splits, columns for vertical, 80 otherwise
local function term_size(term)
  if term.direction == "horizontal" then
    return vim.o.lines * 0.25 -- a quarter of the screen height
  elseif term.direction == "vertical" then
    return vim.o.columns * 0.5 -- half of the screen width
  end
  return 80
end

---@type LazySpec
return {
  "akinsho/toggleterm.nvim",
  opts = { size = term_size },
}
