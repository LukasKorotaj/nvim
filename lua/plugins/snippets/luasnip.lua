return {
  "L3MON4D3/LuaSnip",
  version = "v2.*", -- Recommended for Neovim >= 0.8
  build = "make install_jsregexp", -- Needed for JS/TS regex support
  opts = {
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
    -- Other default luasnip options can go here
  },
  config = function(_, opts)
    require("luasnip").setup(opts)


    -- Additional keymaps can be set up here if needed
    -- For example:
    -- vim.keymap.set({"i", "s"}, "<c-k>", function()
    --   require("luasnip").expand_or_jump()
    -- end, {silent = true})
  end,
}
