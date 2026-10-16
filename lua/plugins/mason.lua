-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason
-- ---------------
-- Policy: CLI tools (language servers, formatters, linters, the tree-sitter CLI) are
-- installed with Homebrew and found on $PATH. Neovim must never download its own
-- duplicate copies. Mason stays loaded only because AstroNvim's `:Mason` UI and
-- DAP integration expect it; it installs nothing automatically.
--
-- Since AstroNvim v5, all automatic Mason installs flow through mason-tool-installer
-- (community packs such as `pack.lua` append to its `ensure_installed`), so emptying
-- that list here is the single switch that stops self-installation.
-- Language servers found on $PATH are enabled via `servers` in astrolsp.lua.

---@type LazySpec
return {
  {
    "mason-org/mason.nvim",
    opts = {
      log_level = vim.log.levels.DEBUG,
      -- Append (not prepend) Mason's bin dir so Homebrew binaries on $PATH always win
      -- over anything left in ~/.local/share/nvim/mason.
      PATH = "append",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- A function (not a table) is required: `opts_extend` would otherwise append to,
    -- rather than clear, the lists that core and community packs contribute.
    opts = function(_, opts)
      opts.ensure_installed = {}
      opts.auto_update = false
      opts.run_on_start = false
    end,
  },
}
