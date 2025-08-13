return {
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
  opts = {
    -- disable jump mode (which binds "s")
    modes = {
      char = {
        enabled = true,
        keys = { "t", "T" },
      },
    },
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },
    {
      "f",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash Jump",
    },
    {
      "F",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "x", "o" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<C-s>",
      mode = "c",
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
