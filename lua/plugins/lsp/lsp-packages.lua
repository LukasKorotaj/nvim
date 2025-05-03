return {
  -- Mason (LSP Installer)
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    opts = {
      ui = { border = 'rounded' },
    },
    config = function(_, opts)
      require('mason').setup(opts)
    end,
  },

  -- Mason-LSPConfig (Bridge)
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      -- Auto-install these LSPs
      require('mason-lspconfig').setup {
        automatic_installation = true,
        ensure_installed = {
          'lua_ls',
          'bashls',
          'r_language_server',
          -- Add others as needed
        },
      }
    end,
  },

  -- LSP Configurations
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'folke/neodev.nvim',
    },
    config = function()
      local lspconfig = require 'lspconfig'
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Shared on_attach function
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }

        -- Keymaps
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end

      -- Setup default handlers
      require('mason-lspconfig').setup_handlers {
        function(server_name)
          lspconfig[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
          }
        end,

        -- Special Lua config
        ['lua_ls'] = function()
          require('neodev').setup()
          lspconfig.lua_ls.setup {
            settings = {
              Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
              },
            },
          }
        end,
      }

      -- Global LSP settings
      vim.diagnostic.config {
        virtual_text = false, -- Disable inline error messages
        underline = true, -- Keep underlines
        signs = true, -- Show gutter icons
        update_in_insert = false, -- Don't update while typing
        severity_sort = true, -- Sort errors above warnings
        float = { -- Settings for manual hover
          border = 'rounded',
          source = 'always',
          header = '',
          prefix = '',
        },
      }
    end,
  },
  -- LSP Progress Notifications
  {
    'j-hui/fidget.nvim',
    tag = 'legacy', -- Important for stability
    event = 'LspAttach', -- Loads when LSP attaches to a buffer
    config = function()
      require('fidget').setup {
        text = {
          spinner = 'dots', -- Animation style
          done = '✓', -- Character shown when LSP finishes
        },
        window = {
          blend = 0, -- Fully opaque window
          border = 'rounded',
        },
      }
    end,
  },

  -- Better Diagnostics List
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble', 'TroubleToggle' }, -- Commands to load the plugin
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- For icons
    config = function()
      require('trouble').setup {
        position = 'bottom', -- Position of the trouble window
        height = 10, -- Height of the window
        icons = true, -- Use devicons
        use_diagnostic_signs = true, -- Use your LSP diagnostic signs
      }
    end,
  },
}
