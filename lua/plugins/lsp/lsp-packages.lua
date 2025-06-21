return {
  -- Mason (LSP Installer)
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    opts = {
      ui = { border = 'rounded' },
      registries = {
        'github:mason-org/mason-registry',
      },
    },
    config = function(_, opts)
      require('mason').setup(opts)
    end,
  },

  -- Mason-LSPConfig (Bridge + auto-install for non-Java servers)
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      local mason_lspconfig = require 'mason-lspconfig'
      local lspconfig = require 'lspconfig'
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Shared on_attach for keymaps
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end

      mason_lspconfig.setup {
        ensure_installed = { 'lua_ls', 'bashls', 'r_language_server' },
        handlers = {
          -- default handler for all installed servers except Java
          function(server_name)
            require('lspconfig')[server_name].setup {
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
        },
      }
    end,
  },

  {
    'nvim-java/nvim-java',
    ft = 'java', -- only load for Java files
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- 2) Initialize nvim-java (installs jdtls, plugins, neoconf, etc.)
      require('java').setup {
        jdtls = {
          version = '1.46.1',
        },
      }

      -- 3) Hook it into lspconfig
      require('lspconfig').jdtls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          java = {
            signatureHelp = {
              enabled = true,
              description = { enabled = true },
            },
            -- any other java.* settings
          },
        },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'folke/neodev.nvim' },
    config = function()
      vim.diagnostic.config {
        virtual_text = false,
        underline = true,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = 'rounded', source = 'always', header = '', prefix = '' },
      }
    end,
  },

  -- LSP Progress Notifications
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    event = 'LspAttach',
    config = function()
      require('fidget').setup {
        text = { spinner = 'dots', done = '✓' },
        window = { blend = 0, border = 'rounded' },
      }
    end,
  },

  -- Better Diagnostics List (Trouble)
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    opts = {},
    keys = {
      { '<leader>xx', '<cmd>TroubleToggle<cr>', desc = 'Toggle Trouble' },
      { '<leader>xd', '<cmd>Trouble workspace_diagnostics<cr>', desc = 'Workspace Diagnostics' },
      { '<leader>xX', '<cmd>Trouble toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics' },
      { '<leader>xs', '<cmd>Trouble lsp_document_symbols<cr>', desc = 'Document Symbols' },
      { '<leader>xl', '<cmd>Trouble lsp_definitions<cr>', desc = 'LSP Definitions' },
      { '<leader>xL', '<cmd>Trouble loclist<cr>', desc = 'Location List' },
      { '<leader>xQ', '<cmd>Trouble quickfix<cr>', desc = 'Quickfix List' },
    },
  },
}
