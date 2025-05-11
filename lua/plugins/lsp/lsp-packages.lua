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
        handlers = {
          function(server_name)
            lspconfig[server_name].setup {
              on_attach = on_attach,
              capabilities = capabilities,
            }
          end,

          -- Special Lua config
          lua_ls = function()
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

          jdtls = function()
            require('java').setup {}

            require('lspconfig').jdtls.setup {
              settings = {
                java = {
                  signatureHelp = {
                    enabled = true, -- Enable signature help
                    description = {
                      enabled = true,
                    },
                  },
                },
                root_markers = {
                  'settings.gradle',
                  'settings.gradle.kts',
                  'pom.xml',
                  'build.gradle',
                  'mvnw',
                  'gradlew',
                  'build.gradle',
                  'build.gradle.kts',
                },
              },
            }
          end,
        },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'folke/neodev.nvim',
      'nvim-java/nvim-java',
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
    opts = {},
    cmd = 'Trouble',
    keys = {
      {
        '<leader>x',
        '',
        desc = '[T]rouble diagnostics',
      },
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>xs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>xl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
}
