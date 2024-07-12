return {
  "EdenEast/nightfox.nvim",
  opts = {
    options = {
      module_default = false,
      modules = {
        aerial = true,
        cmp = true,
        ["dap-ui"] = true,
        dashboard = true,
        diagnostic = true,
        gitsigns = true,
        native_lsp = true,
        neotree = true,
        notify = true,
        symbol_outline = true,
        telescope = true,
        treesitter = true,
        whichkey = true,
      },
    },
    groups = { all = { NormalFloat = { link = "Normal" } } },
  },
  config = function(_, opts)
    local nightfox = require "nightfox"
    nightfox.setup(opts)
    -- vim.cmd.colorscheme "nightfox"
  end,
}