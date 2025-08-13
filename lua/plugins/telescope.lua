return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
      "kkharji/sqlite.lua",
      "danielfalk/smart-open.nvim",
    },
    keys = {
      {
        ";t",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find Files",
      },
      { ";f", "<cmd>Telescope smart_open<cr>", desc = "Smart Open" },
      {
        ";r",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Live Grep (args)",
      },
      {
        ";;",
        function()
          require("telescope.builtin").resume()
        end,
        desc = "Resume Last Search",
      },
      {
        ";e",
        function()
          require("telescope.builtin").diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end,
        desc = "Grep String Input",
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      file_ignore_patterns = {
        "**/node_modules/**",
        "**/.git/**",
        "**/k8s/**",
        "assets",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")

      telescope.setup(opts)
      telescope.load_extension("live_grep_args")
      telescope.load_extension("smart_open")
    end,
  },
}
