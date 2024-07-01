-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

local language_packs = {
  "lua",
  --  "rust",
  --  "go",
  -- "python",
  --  "html-css",
  "helm",
  --  "typescript",
  -- "nix",
  "markdown",
  --  "ruby",
  --  "tailwindcss",
  --  "typst",
  --  "vue",
  "yaml",
}

local other_community_packages = {
  "keybinding.nvcheatsheet-nvim",
}

---@type LazySpec
local community_packages = {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
}

for _, lang in ipairs(language_packs) do
  table.insert(community_packages, { import = "astrocommunity.pack." .. lang })
end
for _, pkg in ipairs(other_community_packages) do
  table.insert(community_packages, { import = "astrocommunity." .. pkg })
end

return community_packages
