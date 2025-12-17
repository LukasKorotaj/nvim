return {
  {
    'kylechui/nvim-surround',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    version = '^3.0.0', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        keymaps = {
          --insert = '<C-g>s',
          --insert_line = '<C-g>S',
          normal = 'm',
          --normal_cur = 'yss',
          --normal_line = 'yS',
          --normal_cur_line = 'ySS',
          --visual = 'S',
          --visual_line = 'gS',
          delete = 'md',
          change = 'mc',
          --change_line = 'cS',
        },
      }
    end,
  },
}
