-- Better Diagnostics List (Trouble)
return {
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    opts = {},
    keys = {
      { '<leader>xx', '<cmd>TroubleToggle<cr>', desc = 'Toggle Trouble' },
      { '<leader>xd', '<cmd>Trouble workspace_diagnostics<cr>', desc = 'Workspace Diagnostics' },
      { '<leader>xX', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Buffer Diagnostics' },
      { '<leader>xs', '<cmd>Trouble lsp_document_symbols<cr>', desc = 'Document Symbols' },
      { '<leader>xl', '<cmd>Trouble lsp_definitions<cr>', desc = 'LSP Definitions' },
      { '<leader>xL', '<cmd>Trouble loclist<cr>', desc = 'Location List' },
      { '<leader>xQ', '<cmd>Trouble quickfix<cr>', desc = 'Quickfix List' },
    },
  },
}
