-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local termSize = function(term)
  if term.direction == "horizontal" then
    return vim.o.lines * 0.25
  elseif term.direction == "vertical" then
    return vim.o.columns * 0.5
  else
    return 80
  end
end
return {
  {
    "akinsho/toggleterm.nvim",
    config = function(_, opts)
      opts.size = termSize
      opts.on_create = function(t)
        vim.opt.foldcolumn = "0"
        vim.opt.signcolumn = "no"
        local toggle = function() t:toggle() end
        vim.keymap.set({ "n", "t", "i" }, "<C-'>", toggle, { desc = "Toggle terminal", buffer = t.bufnr })
        vim.keymap.set({ "n", "t", "i" }, "<F7>", toggle, { desc = "Toggle terminal", buffer = t.bufnr })
      end
      require("toggleterm").setup(opts)
    end,
  },
}
