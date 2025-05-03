
return {
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    opts = {
      under_cursor = false,
      filetypes_denylist = {
        "Outline",
        "TelescopePrompt",
        "alpha",
        "harpoon",
        "reason",
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
}
