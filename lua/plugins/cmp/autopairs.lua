return {
  {
    'windwp/nvim-autopairs',
    version = '*',
    opts = {
      disable_filetype = { 'TelescopePrompt', 'vim' },
      enable_afterquote = true,
      enable_check_bracket_line = true,
      enable_bracket_in_quote = true,
      enable_abbr = false,
      break_undo = true,
      check_ts = false,
      map_cr = true,
      map_bs = true,
      map_c_h = false,
    },
    config = function(_, opts)
      require('nvim-autopairs').setup(opts)
    end,
  },
}
