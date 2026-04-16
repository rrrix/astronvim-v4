# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

An AstroNvim v4 configuration for Neovim. All code is Lua. There is no build step or test suite.

## Linting and Formatting

```bash
stylua lua/          # format all Lua files (config in .stylua.toml: 120 cols, 2-space indent, double quotes)
selene lua/          # lint all Lua files (config in selene.toml: neovim std)
```

## Bootstrap Flow

`init.lua` bootstraps lazy.nvim from git, then loads two files in order:
1. `lua/lazy_setup.lua` — calls `lazy.setup()` with three plugin spec sources: AstroNvim core, AstroCommunity packs, and user plugins from `lua/plugins/`
2. `lua/polish.lua` — post-setup customizations applied after all plugins load

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
| `astrocore.lua` | Vim options, features (autopairs, cmp, diagnostics), and primary keymaps |
| `astrolsp.lua` | LSP features, format-on-save rules, per-server `lspconfig` settings, LSP keymaps |
| `mappings.lua` | Additional keymaps merged into astrocore via `vim.tbl_deep_extend` |
| `mason.lua` | Mason-managed LSP servers, formatters, linters, debuggers |
| `none-ls.lua` | null-ls formatter and diagnostic sources (data-driven via `none_ls_builtins` table) |
| `treesitter.lua` | Treesitter grammar ensure_installed list |
| `user.lua` | Third-party plugins, disabled defaults, autopairs rules, CUE/Dagger tooling |
| `community.lua` | AstroCommunity language pack imports (only `lua` is active; others commented out) |
| `cmp.lua` | nvim-cmp completion sources and keybindings |
| `astroui.lua` | Colorscheme (`carbonfox`), highlight overrides, status-line icons |

### Key Conventions

- **Leader:** `<Space>` — **Local leader:** `,`
- **Deactivation guard:** Each plugin file starts with `-- if true then return {} end` — uncomment this line to disable the entire file
- **Format on save:** Globally disabled; whitelisted for `lua`, `go`, `python` only
- **LSP servers via Mason:** `yamlls`, `ruff`, `lua_ls`, `dagger`
- Comments are set to orange (`#ff9900`) globally in `polish.lua`
