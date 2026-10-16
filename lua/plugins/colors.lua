return {
  "EdenEast/nightfox.nvim",
  opts = {
    options = {
      module_default = false,
      -- Highlight integrations for plugins actually in use under AstroNvim v6:
      -- blink.cmp replaced nvim-cmp, mini.icons replaced devicons, and snacks.nvim
      -- (no nightfox module) replaced telescope, nvim-notify, and alpha.
      modules = {
        aerial = true,
        blink = true,
        dap_ui = true,
        diagnostic = true,
        gitsigns = true,
        lazy = true,
        lsp_semantic_tokens = true,
        mini = true,
        native_lsp = true,
        neotree = true,
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
