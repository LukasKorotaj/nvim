return {
  {
    'renerocksai/telekasten.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-telekasten/calendar-vim' },
    opts = {
      home = vim.fn.expand '~/vaults/telekasten/',
      dailies = 'journal/daily',
      weeklies = 'journal/weekly',
      templates = 'templates',
    },
  },
}
