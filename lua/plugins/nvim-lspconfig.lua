return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Skip LSP for big files
      on_attach = function(client, bufnr)
        if vim.b[bufnr].big_file then
          vim.lsp.buf_detach_client(bufnr, client.id)
          return
        end
      end,
      servers = {
        -- Option A: use vtsls (recommended for monorepos)
        vtsls = {
          cmd_env = { NODE_OPTIONS = "--max-old-space-size=8192" },
          settings = {
            typescript = {
              tsserver = { maxTsServerMemory = 8192 },
              inlayHints = {
                parameterNames = { enabled = "none" },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
            },
            javascript = {
              tsserver = { maxTsServerMemory = 8192 },
              inlayHints = {
                parameterNames = { enabled = "none" },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
            },
            vtsls = {
              tsserver = { globalPlugins = {} },
            },
          },
        },

        -- Option B: alternatively, use tsserver directly
        -- (disable this if you want vtsls to take over)
        -- tsserver = {
        --   cmd_env = { NODE_OPTIONS = "--max-old-space-size=8192" },
        --   settings = {
        --     typescript = { tsserver = { maxTsServerMemory = 8192 } },
        --     javascript = { tsserver = { maxTsServerMemory = 8192 } },
        --   },
        -- },
      },
    },
  },
}
