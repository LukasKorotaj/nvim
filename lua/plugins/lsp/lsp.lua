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
  vim.lsp.config('rust_analyzer', {
    settings = {
      completion = { autoimport = true },
      procMacro = true,
      cargo = { loadOutDirsFromCheck = true },
    },
  }),
}
