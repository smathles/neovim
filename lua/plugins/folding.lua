-- TODO: Add folding for comment blocks!

-- To be honest, there's SO much more this plugin can do! Like a "folding" column,
-- preview of the folded content etc. This is a very minimal config!
return { -- lazy.nvim plugin specification
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      -- General fold settings
      vim.o.foldcolumn = '0'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Key mappings for ufo
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })

      -- Setup ufo with options (choose one below)
      require('ufo').setup {
        -- Example for using treesitter and indent
        provider_selector = function(_, _, _)
          return { 'treesitter', 'indent' }
        end,
      }
    end,
  },

  { -- Optional LSP configuration for nvim-ufo
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local lspconfig = require 'lspconfig'
      local servers = lspconfig.util.available_servers() -- List of all available servers
      for _, server in ipairs(servers) do
        lspconfig[server].setup {
          capabilities = capabilities,
        }
      end
    end,
  },
  -- Optional: coc.nvim setup
  -- {
  --   'neoclide/coc.nvim',
  --   branch = 'master',
  --   build = 'yarn install --frozen-lockfile',
  -- },
}
