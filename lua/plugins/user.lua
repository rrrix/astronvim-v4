-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- Discord Rich Presence for Neovim
  -- "andweeb/presence.nvim",

  -- LSP signature hint as you type
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- customize alpha options

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"

      -- remove add single quote on filetype scheme or lisp
      npairs.get_rules("'")[1].not_filetypes = { "scheme", "lisp" }
      npairs.get_rules("'")[1]:with_pair(cond.not_after_text "[")

      -- Disable [] pairs for ANSI escape codes
      npairs.get_rules("[")[1]:with_pair(cond.not_before_regex("\\e", 2))
      npairs.get_rules("[")[1]:with_pair(cond.not_after_regex("\\e", 2))
      npairs.remove_rule "["

      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- Disable [] pairs for ANSI escape codes
        Rule("[", "]"):with_pair(cond.not_after_text "\\e"):with_pair(cond.not_inside_quote()),
        Rule("$'\\e", "[m'")
      )
    end,
  },
  {
    "mcauley-penney/tidy.nvim",
    opts = {
      enabled_on_save = true,
      filetype_exclude = { "diff" },
    },
    config = function(_, opts)
      local tidy = require "tidy"
      tidy.setup(opts)
      vim.keymap.set("n", "<leader>T", require("tidy").run, { desc = "Strip trailing whitespace (Tidy)" })
      vim.keymap.set("n", "<leader>uT", require("tidy").toggle, { desc = "Toggle Strip Trailing Whitespace (Tidy)" })
    end,
  },

    -- Cue support
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "cue" })
      end
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "cueimports" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "dagger" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "cuelsp", "cueimports" })
    end,
  },
}
