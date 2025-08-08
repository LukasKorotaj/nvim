return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
  -- NOTE: Commenting this out as I have no fucking idea when i put this in
  -- or when did I ever use this.
  --{
  --  'nvim-treesitter/nvim-treesitter-textobjects',
  --  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --  config = function()
  --    require('nvim-treesitter.configs').setup {
  --      textobjects = {
  --        select = {
  --          enable = true,
  --          lookahead = true,
  --          keymaps = {
  --            ['aa'] = '@parameter.outer',
  --            ['af'] = '@function.outer',
  --            ['if'] = '@function.inner',
  --            ['ia'] = '@parameter.inner',
  --            ['ac'] = '@class.outer',
  --            ['ic'] = '@class.inner',
  --            ['ii'] = '@conditional.inner',
  --            ['ai'] = '@conditional.outer',
  --            ['il'] = '@loop.inner',
  --            ['al'] = '@loop.outer',
  --            ['at'] = '@comment.outer',
  --          },
  --        },
  --        move = {
  --          enable = true,
  --          goto_next_start = {
  --            [']m'] = '@function.outer',
  --            [']]'] = '@class.outer',
  --          },
  --          goto_next_end = {
  --            [']M'] = '@function.outer',
  --            [']['] = '@class.outer',
  --          },
  --          goto_previous_start = {
  --            ['[m'] = '@function.outer',
  --            ['[['] = '@class.outer',
  --          },
  --          goto_previous_end = {
  --            ['[M'] = '@function.outer',
  --            ['[]'] = '@class.outer',
  --          },
  --        },
  --        swap = {
  --          enable = true,
  --          swap_next = {
  --            ['<leader>a'] = '@parameter.inner',
  --          },
  --          swap_previous = {
  --            ['<leader>A'] = '@parameter.outer',
  --          },
  --        },
  --      },
  --    }
  --  end,
  --},
}
