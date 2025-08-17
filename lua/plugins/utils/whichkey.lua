return {
  {
    'folke/which-key.nvim',
    opts = {
      plugins = {
        marks = false,
        registers = true,
        spelling = true,
      },
      spec = {
        { '<leader>O', group = 'Obsidian', icon = { icon = '', color = 'purple' } },

        { '<leader>Ob', '<cmd>Obsidian backlinks<cr>', desc = 'Backlinks', icon = { icon = '󰌹', color = 'cyan' } },
        { '<leader>Od', '<cmd>Obsidian dailies<cr>', desc = 'Dailies', icon = { icon = '󰃭', color = 'yellow' } },
        { '<leader>Oe', '<cmd>Obsidian extract_note<cr>', desc = 'Extract Note', icon = { icon = '', color = 'purple' }, mode = 'v' },
        { '<leader>Of', '<cmd>Obsidian follow_link<cr>', desc = 'Follow Link', icon = { icon = '󰌷', color = 'blue' } },
        { '<leader>Ol', '<cmd>Obsidian link<cr>', desc = 'Link Selection', icon = { icon = '󰌹', color = 'green' }, mode = 'v' },
        { '<leader>On', '<cmd>Obsidian link_new<cr>', desc = 'New Link', icon = { icon = '󰌹', color = 'green' }, mode = 'v' },
        { '<leader>OL', '<cmd>Obsidian links<cr>', desc = 'List Links', icon = { icon = '', color = 'cyan' } },
        { '<leader>ON', '<cmd>Obsidian new<cr>', desc = 'New Note', icon = { icon = '', color = 'green' } },
        { '<leader>Ot', '<cmd>Obsidian new_from_template<cr>', desc = 'From Template', icon = { icon = '', color = 'yellow' } },
        { '<leader>Oo', '<cmd>Obsidian open<cr>', desc = 'Open in App', icon = { icon = '', color = 'blue' } },
        { '<leader>Oi', '<cmd>Obsidian paste_img<cr>', desc = 'Paste Image', icon = { icon = '󰋩', color = 'purple' } },
        { '<leader>Oq', '<cmd>Obsidian quick_switch<cr>', desc = 'Quick Switch', icon = { icon = '󰒃', color = 'orange' } },
        { '<leader>Or', '<cmd>Obsidian rename<cr>', desc = 'Rename Note', icon = { icon = '󰑕', color = 'red' } },
        { '<leader>Os', '<cmd>Obsidian search<cr>', desc = 'Search Notes', icon = { icon = '󰍉', color = 'yellow' } },
        { '<leader>Og', '<cmd>Obsidian tags<cr>', desc = 'Tags', icon = { icon = '', color = 'green' } },
        { '<leader>OT', '<cmd>Obsidian template<cr>', desc = 'Insert Template', icon = { icon = '', color = 'cyan' } },
        { '<leader>Oy', '<cmd>Obsidian today<cr>', desc = 'Today', icon = { icon = '󰃭', color = 'yellow' } },
        { '<leader>Om', '<cmd>Obsidian tomorrow<cr>', desc = 'Tomorrow', icon = { icon = '󰃭', color = 'blue' } },
        { '<leader>Oc', '<cmd>Obsidian toc<cr>', desc = 'Table of Contents', icon = { icon = '', color = 'green' } },
        { '<leader>Ox', '<cmd>Obsidian toggle_checkbox<cr>', desc = 'Toggle Checkbox', icon = { icon = '', color = 'green' } },
        { '<leader>Ow', '<cmd>Obsidian workspace<cr>', desc = 'Switch Workspace', icon = { icon = '󰙴', color = 'purple' } },
        { '<leader>OY', '<cmd>Obsidian yesterday<cr>', desc = 'Yesterday', icon = { icon = '󰃭', color = 'red' } },
      },
      icons = {
        group = '󰋼',
      },
    },
  },
}
