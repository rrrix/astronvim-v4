-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- Customize nvim-ts-autotag (auto-close/rename of HTML/XML tag pairs).
--
-- nvim-ts-autotag is pulled in by AstroNvim core (astronvim/plugins/ts-autotag.lua)
-- and aliases several filetypes to "html" so they inherit tag auto-closing. One of
-- those aliases is `markdown = "html"`, which means typing `<foo>` in a Markdown
-- buffer auto-inserts `</foo>`.
--
-- We frequently type XML-looking placeholder tokens in Markdown (e.g. `<name>`,
-- `<service>`, `<env>`) that are NOT real elements and should never be closed.
-- Disabling auto-close for Markdown removes the unwanted `</foo>` while keeping
-- the behavior for real markup filetypes (html, xml, jsx/tsx, vue, svelte, ...).

---@type LazySpec
return {
  "windwp/nvim-ts-autotag",
  -- Core declares `opts = {}`, so this table deep-merges on top rather than
  -- replacing it. `per_filetype` overrides are applied via vim.tbl_deep_extend
  -- over the base opts in the plugin's Setup.get_opts(), so we only need to
  -- specify the single field we want to change.
  opts = {
    per_filetype = {
      markdown = {
        -- Stop auto-inserting the matching close tag (`<foo>` no longer becomes
        -- `<foo></foo>`). `enable_rename` is intentionally left at its default
        -- (true) so paired-tag renaming still works if a real pair ever exists.
        enable_close = false,
      },
    },
  },
}
