return {
  {
    'neovim/nvim-lspconfig',
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {
          settings = {
            pyright = { autoImportCompletion = true },
            python = { analysis = { autoSearchPaths = true, diagnosticMode = 'openFilesOnly', typeCheckingMode = 'off' } },
          },
        },
      },
    },
  },
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'jose-elias-alvarez/typescript.nvim',
      init = function()
        require('lazyvim.util').lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set('n', '<leader>cR', 'TypescriptRenameFile', { desc = 'Rename File', buffer = buffer })
        end)
      end,
    },
  },
}
