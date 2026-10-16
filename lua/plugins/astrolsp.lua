-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: lua-language-server (Homebrew) provides autocomplete and documentation while editing this config

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = false, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          "lua",
          "go",
          "python",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          "bash",
          "yaml",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- Language servers to enable. All are installed with Homebrew and found on $PATH;
    -- Mason is not used to install them (see mason.lua).
    servers = {
      "cue", -- `cue lsp`, from the `cue` formula
      "lua_ls", -- lua-language-server
      "ruff",
      "yamlls", -- yaml-language-server
    },
    -- customize language server configuration passed to `vim.lsp.config`
    -- client specific configuration can also go in `lsp/` in the configuration root (see `:h lsp-config`)
    ---@diagnostic disable: missing-fields
    config = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              path = {
                "lua/?.lua",
                "lua/?/init.lua",
              },
              version = "LuaJIT",
            },
            hint = {
              enable = true,
              arrayIndex = "Disable",
            },
            workspace = {
              library = {
                "/opt/homebrew/opt/lpeg/lib/lua",
                "/opt/homebrew/opt/lpeg/share/lua",
                "/opt/homebrew/opt/lua@5.4/include/lua",
                "/opt/homebrew/opt/lua/include/lua",
                "/opt/homebrew/opt/luv/lib/lua",
                "/opt/homebrew/opt/neovim/share/nvim/runtime/lua",
                "/opt/homebrew/opt/neovim/share/nvim/runtime/queries/lua",
              },
            },
          },
        },
      },
      -- clangd = { capabilities = { offsetEncoding = "utf-8" } },
      yamlls = {
        settings = {
          yaml = {
            validate = true,
            hover = true,
            format = {
              enable = true,
              singleQuote = false,
              bracketSpacing = true,
              printWidth = 120,
            },
            customTags = { "!reference sequence" },
          },
        },
      },
    },
    -- customize how language servers are attached
    handlers = {
      -- a function with the key `*` modifies the default handler, taking the server name as its parameter
      -- ["*"] = function(server) vim.lsp.enable(server) end

      -- the key is the server that is being setup with `vim.lsp.config`
      -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
    },
    -- Document-highlight-on-hover is provided by `snacks.words` since AstroNvim v5, so the
    -- former `lsp_document_highlight` autocmds were removed to avoid duplicate requests.
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        gl = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" },
        -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client:supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
      },
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lsp-attach`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}
