# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

An AstroNvim v6 configuration for Neovim 0.12+. All code is Lua. There is no build step or test suite.

## Linting and Formatting

```bash
stylua lua/          # format all Lua files (config in .stylua.toml: 120 cols, 2-space indent, double quotes)
selene lua/          # lint all Lua files (config in selene.toml: neovim std)
```

## Bootstrap Flow

`init.lua` bootstraps lazy.nvim from git, then loads two files in order:
1. `lua/lazy_setup.lua` - calls `lazy.setup()` with three plugin spec sources: AstroNvim core, AstroCommunity packs, and user plugins from `lua/plugins/`
2. `lua/polish.lua` - post-setup customizations applied after all plugins load

## Architecture

### Plugin Spec Pattern

Every file in `lua/plugins/` returns a LazySpec (table or list of tables). AstroNvim plugins use a functional `opts` pattern to merge with upstream defaults:

```lua
opts = function(_, opts)
  opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { ... })
end
```

Use `require("astrocore").list_insert_unique()` when appending to lists to prevent duplicates. Use `vim.tbl_deep_extend("force", ...)` for merging nested tables.

### Plugin File Responsibilities

| File | Concern |
|------|---------|
| `astrocore.lua` | Vim options, features (autopairs, completion, diagnostics), and all custom keymaps |
| `astrolsp.lua` | LSP features, format-on-save rules, enabled `servers`, per-server `vim.lsp.config` settings, LSP keymaps |
| `mason.lua` | Disables all Mason auto-installs; tools come from Homebrew on `$PATH` |
| `none-ls.lua` | null-ls formatter and diagnostic sources (data-driven via `none_ls_builtins` table) |
| `treesitter.lua` | Parser list and highlight/indent toggles via AstroCore `treesitter` opts |
| `user.lua` | Third-party plugins, disabled defaults, autopairs rules |
| `community.lua` | AstroCommunity language pack imports (only `lua` is active; others commented out) |
| `astroui.lua` | Colorscheme (`carbonfox`), highlight overrides (orange comments), status-line icons |

### Key Conventions

- **Leader:** `<Space>` - **Local leader:** `,`
- **Deactivation guard:** Each plugin file starts with `-- if true then return {} end` - uncomment this line to disable the entire file
- **Format on save:** Globally disabled; whitelisted for `lua`, `go`, `python` only
- **No Mason installs:** CLI tools are Homebrew-owned; see README "Requirements". LSP servers enabled: `cue`, `lua_ls`, `ruff`, `yamlls`
- **Completion:** `blink.cmp` (AstroNvim v5+ default); there is no `nvim-cmp` override
- Comments are set to orange (`#ff9900`) globally via `highlights.init` in `astroui.lua`
