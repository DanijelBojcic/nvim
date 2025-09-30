return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = opts.keymap or {}
    opts.keymap.preset = opts.keymap.preset or "enter" -- LazyVim default
    -- VS Code–style manual trigger on Alt+Space
    opts.keymap["<A-Space>"] = { "show", "show_documentation", "hide_documentation" }
    -- some terminals send <M-…> instead of <A-…>
    opts.keymap["<M-Space>"] = opts.keymap["<A-Space>"]
  end,
}
