return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    git_status = {
      window = {
        mappings = {
          -- Use async git operations
          ["A"] = "git_add_all",
          ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gr"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gg"] = "git_commit_and_push",
        },
      },
    },
    -- Reduce refresh frequency
    filesystem = {
      use_libuv_file_watcher = false, -- Disable file watcher (can be slow)
      scan_mode = "shallow", -- Don't deep scan
    },
    -- Async git status fetching
    async_directory_scan = "always",
    -- Limit git status to avoid scanning entire repo
    git_status_async = true,
    git_status_async_options = {
      batch_size = 100, -- Process in smaller batches
      batch_delay = 10,
    },
  },
}
