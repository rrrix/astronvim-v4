-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- Customize None-ls sources

local none_ls_builtins = {
  formatting = {
    "black",
    "clang_format",
    "goimports",
    "hclfmt",
    "isort",
    "nixfmt",
    "prettier",
    "rubocop",
    "stylua",
    "terraform_fmt",
    "tidy",
    "typstfmt",
    "yamlfmt",
  },
  diagnostics = {
    "golangci_lint",
    "pylint",
    "rstcheck",
    "rubocop",
    "saltlint",
    "selene",
    "terraform_validate",
    "tfsec",
    "trail_space",
  },
}

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    local sources = {}
    -- Iterate through the none_ls_builtins table and insert values into sources
    for src, names in pairs(none_ls_builtins) do
      for _, name in ipairs(names) do
        -- Use dynamic reference to null_ls.builtins
        table.insert(sources, null_ls.builtins[src][name])
      end
    end
    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    -- config.sources = {
    --   -- Set a formatter
    --   null_ls.builtins.formatting.stylua,
    --   null_ls.builtins.formatting.prettier,
    -- }
    config.sources = sources
    return config -- return final config table
  end,
}
