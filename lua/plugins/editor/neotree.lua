-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- Optional, for file icons
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      {
        '\\',
        '<cmd>Neotree toggle<cr>',
        desc = 'Open/Close Neotree',
        mode = 'n',
      },
    },
    opts = {
      sources = {
        'filesystem',
        'buffers',
        'git_status',
        'document_symbols',
      },
      add_blank_line_at_top = false,
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = {
          enabled = true,
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = '󰅂',
          expander_expanded = '󰅀',
          expander_highlight = 'NeoTreeExpander',
        },
        git_status = {
          symbols = {
            added = ' ',
            conflict = '󰩌 ',
            deleted = '󱂥',
            ignored = ' ',
            modified = ' ',
            renamed = '󰑕',
            staged = '󰩍',
            unstaged = '',
            untracked = ' ',
          },
        },
      },
    },
  },
}
