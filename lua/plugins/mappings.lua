-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local maps = {
  -- normal mode
  n = {
    ["<leader>"] = { name = "Utilities/Plugins" },
    ["["] = { name = "Previous ..." },
    ["]"] = { name = "Next ..." },
    g = { name = "Go ..." },
    z = { name = "Folds/Spelling ..." },

    -- Show Which-Key
    -- ["<C-/>"] = { "<Cmd>WhichKey<CR>", desc = "Show Which-Key (Keymappings)" },

    ["<leader>th"] = { "<cmd>ToggleTerm direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
    ["<leader>tv"] = { "<cmd>ToggleTerm direction=vertical<cr>", desc = "ToggleTerm vertical split" },

    ["<a-j>"] = { "<cmd>move .+1<cr>==", desc = "move line(s) down" },
    ["<a-k>"] = { "<cmd>move .-2<cr>==", desc = "move line(s) up" },
  },
  -- Insert Mode
  i = {
    -- Show Which-Key
    ["<C-/>"] = { "<Cmd>WhichKey<CR>", desc = "Show Which-Key (Keymappings)" },

    ["<A-j>"] = { "<Esc><cmd>move .+1<cr>==gi" },
    ["<A-k>"] = { "<Esc><cmd>move .-2<cr>==gi" },
  },
  -- Visual Mode
  v = {
    ["<C-/>"] = { "<Cmd>WhichKey<CR>", desc = "Show Which-Key (Keymappings)" },
    -- Show Which-Key

    ["<S-Tab>"] = { "<gv", desc = "Unindent line" },
    ["<Tab>"] = { ">gv", desc = "Indent line" },
    ["<"] = { "<gv", desc = "Unindent line" },
    [">"] = { ">gv", desc = "Indent line" },

    -- https://vim.fandom.com/wiki/Moving_lines_up_or_down#Mappings_to_move_lines
    ["<A-k>"] = { "<cmd>'<,'>move '>-2<cr>gv=gv", desc = "Move line(s) up" },
    ["<A-j>"] = { "<cmd>'<,'>move '<+1<cr>gv=gv", desc = "Move line(s) down" },
  },
  -- Terminal Mode
  t = {
    ["<S-ESC>"] = { [[<C-\><C-n>]], desc = "Switch to Normal Mode" },
    ["<C-h>"] = { [[<Cmd>wincmd h<CR>]] },
    ["<C-j>"] = { [[<Cmd>wincmd j<CR>]] },
    ["<C-k>"] = { [[<Cmd>wincmd k<CR>]] },
    ["<C-l>"] = { [[<Cmd>wincmd l<CR>]] },
    ["<C-w>"] = { [[<C-\><C-n><C-w>]] },
  },
}

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = function(_, opts) vim.tbl_deep_extend("force", opts.mappings, maps) end,
  },
  -- {
  --   "AstroNvim/astrolsp",
  --   ---@type AstroLSPOpts
  --   opts = {
  --     mappings = {
  --       n = {
  --         -- this mapping will only be set in buffers with an LSP attached
  --         K = {
  --           function()
  --             vim.lsp.buf.hover()
  --           end,
  --           desc = "Hover symbol details",
  --         },
  --         -- condition for only server with declaration capabilities
  --         gD = {
  --           function()
  --             vim.lsp.buf.declaration()
  --           end,
  --           desc = "Declaration of current symbol",
  --           cond = "textDocument/declaration",
  --         },
  --         ["<leader>rn"] = { vim.lsp.buf.rename() },
  --         ["<S-<F6>>"] = { vim.lsp.buf.rename() },
  --       },
  --     },
  --   },
  -- },
}
