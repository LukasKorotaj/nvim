return {
  {
    "echasnovski/mini.nvim",
    version = "*", -- Use the latest stable version
    config = function()
      -- Configure mini.indentscope
      require("mini.indentscope").setup({
        symbol = "│", -- Set the indent scope symbol
        options = { try_as_border = true }, -- Optional: try to use as border
      })

      -- Configure mini.surround
      require("mini.surround").setup({
        -- Add your custom configurations here
      })
    end,
  },
}

