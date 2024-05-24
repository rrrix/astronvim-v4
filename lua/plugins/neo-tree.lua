-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = function(_, opts)
    -- local defaults = require "neo-tree.defaults"

    local user_opts = {
      log_level = "trace",
      log_to_file = true,
      window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
        }
      },
      close_if_last_window = true,
      filesystem = {
        -- hijack_netrw_behavior = "open_default",
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
        follow_current_file = {
          enabled = true,         -- This will find and focus the file in the active buffer every time
          --                      -- the current file is changed while the tree is open.
          leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
    }

    -- vim.notify(vim.inspect(opts))
    -- vim.notify(vim.inspect(user_opts))

    merged_opts = vim.tbl_deep_extend("force", opts, user_opts)
    -- vim.notify(vim.inspect(merged_opts))
    return merged_opts
  end,
  -- config = true
}
