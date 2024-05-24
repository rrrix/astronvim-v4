-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true,                                 -- enable autopairs at start
      cmp = true,                                       -- enable completion at start
      diagnostics_mode = 3,                             -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true,                              -- highlight URLs at start
      notifications = true,                             -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = {                  -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true,         -- sets vim.opt.number
        spell = false,         -- sets vim.opt.spell
        signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
        wrap = true,           -- sets vim.opt.wrap
      },
      g = {                    -- vim.g.<key>
        zsh_fold_enable = 1,
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },

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
    },
  },
}
