return {
  'benlubas/molten-nvim',
  -- requires pynvim
  dependencies = { 'quarto-dev/quarto-nvim' },
  config = function()
    local runner = require 'quarto.runner'

    vim.keymap.set('n', '<leader>qc', runner.run_cell, { desc = 'run cell', silent = true })
    vim.keymap.set('n', '<leader>qa', runner.run_above, { desc = 'run cell and above', silent = true })
    vim.keymap.set('n', '<leader>qA', runner.run_all, { desc = 'run all cells', silent = true })
    vim.keymap.set('n', '<leader>ql', runner.run_line, { desc = 'run line', silent = true })
    vim.keymap.set('v', '<leader>q', runner.run_range, { desc = 'run visual range', silent = true })
    vim.keymap.set('n', '<leader>qA', function()
      runner.run_all(true)
    end, { desc = 'run all cells of all languages', silent = true })
  end,
  keys = {
    {
      '<leader>mi',
      ':MoltenInit<CR>',
      desc = 'Initialize the plugin',
    },
    {
      '<leader>mr',
      ':MoltenEvaluateOperator<CR>',
      desc = 'Run operator selection',
    },
    {
      '<leader>ml',
      ':MoltenEvaluateLine<CR>',
      desc = 'Evaluate line',
    },
    {
      '<leader>mc',
      ':MoltenReevaluateCell<CR>',
      desc = 'Re-evaluate cell',
    },
    {
      '<leader>mv',
      ':<C-u>MoljtenEvaluateVisual<CR>gv',
      desc = 'Evaluate visual selection',
      mode = 'v',
    },
  },
}
