return {
  'L3MON4D3/LuaSnip',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  version = 'v2.*', -- Recommended for Neovim >= 0.8
  build = 'make install_jsregexp', -- Needed for JS/TS regex support
  opts = {
    enable_autosnippets = true,
    store_selection_keys = '<Tab>',
    -- Other default luasnip options can go here
  },
  config = function(_, opts)
    require('luasnip').setup(opts)

    require('luasnip.loaders.from_lua').load { paths = { vim.fn.stdpath 'config' .. '/lua/plugins/snippets/not_working' }, include = { 'markdown' } }

    require('luasnip.loaders.from_vscode').lazy_load()

    vim.keymap.set({ 'i', 's' }, '<c-l>', function()
      require('luasnip').expand_or_jump()
    end, { silent = true })
  end,
}
