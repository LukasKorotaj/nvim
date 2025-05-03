return {
  {
    "jiaoshijie/undotree",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>ut",
        function()
          require("undotree").toggle()
        end,
        desc = "Undotree",
        mode = "n",
        silent = true,
      },
    },
    config = function()
      require("undotree").setup({
        float_diff = true,
        focus_on_toggle = true,
      })
    end,
  },
}

