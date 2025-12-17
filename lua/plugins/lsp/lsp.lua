local language = vim.lsp.config

return {
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {},
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'neovim/nvim-lspconfig',
      'saghen/blink.cmp',
    },
  },
  language('rust_analyzer', {
    settings = {
      completion = { autoimport = true },
      procMacro = true,
      cargo = { loadOutDirsFromCheck = true },
    },
  }),
  language('ltex', {
    settings = {
      ltex = {
        language = 'sv',
      },
    },
  }),
}
