-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter
-- --------------------
-- Since AstroNvim v6, nvim-treesitter tracks its `main` branch, which is only a
-- parser download/compile utility. Highlighting, indentation, and the list of
-- parsers to install are configured through AstroCore instead.
-- Compiling parsers requires the `tree-sitter` CLI (installed via Mason in mason.lua).

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      highlight = true, -- enable/disable treesitter based highlighting
      indent = true, -- enable/disable treesitter based indentation
      auto_install = true, -- install parsers for detected languages on demand
      -- `tmux` was dropped from this list: nvim-treesitter `main` no longer ships that parser.
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "cue",
        "diff",
        "djot",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "graphql",
        "groovy",
        "hcl",
        "hjson",
        "hocon",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonnet",
        "kotlin",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "objc",
        "promql",
        "proto",
        "puppet",
        "rego",
        "rst",
        "ruby",
        "rust",
        "scala",
        "scss",
        "svelte",
        "swift",
        "teal",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "typst",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
      },
    },
  },
}
