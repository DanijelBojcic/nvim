-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Optimize performance for large files
local big_file_group = vim.api.nvim_create_augroup("BigFile", { clear = true })
vim.api.nvim_create_autocmd("BufReadPre", {
  group = big_file_group,
  callback = function(args)
    local file_size = vim.fn.getfsize(args.file)
    -- Files larger than 100KB
    if file_size > 100 * 1024 then
      vim.b.big_file = true
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.spell = false
      vim.opt_local.swapfile = false
      vim.opt_local.undofile = false
      vim.opt_local.breakindent = false
      vim.opt_local.colorcolumn = ""
      vim.opt_local.statuscolumn = ""
      vim.opt_local.signcolumn = "no"
      -- Disable syntax for very large files (>500KB)
      if file_size > 500 * 1024 then
        vim.cmd("syntax off")
      end
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = big_file_group,
  callback = function()
    if vim.b.big_file then
      -- Disable treesitter highlighting
      pcall(function()
        require("nvim-treesitter.configs").setup({
          highlight = { disable = function() return vim.b.big_file end },
        })
      end)
      vim.notify("Big file detected - some features disabled", vim.log.levels.WARN)
    end
  end,
})
