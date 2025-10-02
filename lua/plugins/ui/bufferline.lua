-- lua/plugins/bufferline.lua
return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        diagnostics = 'nvim_lsp',
        mode = 'buffers',
        close_icon = ' ',
        buffer_close_icon = '󰱝 ',
        modified_icon = '󰔯 ',
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    }
    -- Keymaps
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    keymap('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', vim.tbl_extend('force', opts, { desc = 'Cycle to next buffer' }))
    keymap('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', vim.tbl_extend('force', opts, { desc = 'Cycle to previous buffer' }))
    keymap('n', '<Tab>d', '<cmd>bdelete<cr>', vim.tbl_extend('force', opts, { desc = 'Delete buffer' }))
    keymap('n', '<Tab>bl', '<cmd>BufferLineCloseLeft<cr>', vim.tbl_extend('force', opts, { desc = 'Delete buffers to the left' }))
    keymap('n', '<Tab>bo', '<cmd>BufferLineCloseOthers<cr>', vim.tbl_extend('force', opts, { desc = 'Delete other buffers' }))
    keymap('n', '<Tab>bp', '<cmd>BufferLineTogglePin<cr>', vim.tbl_extend('force', opts, { desc = 'Toggle pin' }))
    keymap('n', '<Tab>bP', '<cmd>BufferLineGroupClose ungrouped<cr>', vim.tbl_extend('force', opts, { desc = 'Delete non-pinned buffers' }))
  end,
}
