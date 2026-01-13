return {
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    opts = {},
    keys = {
      {
        '<leader>rs',
        function()
          require('persistence').load()
        end,
        desc = 'Load the workspace',
      },
      {
        '<leader>rr',
        function()
          require('persistence').select()
        end,
        desc = 'Select the workspace',
      },
    },
  },
}
