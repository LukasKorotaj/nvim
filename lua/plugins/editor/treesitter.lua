return {
  -- nvim-treesitter (core)
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    branch = 'master', -- or "main" (if you want bleeding-edge)
    opts = {
      ensure_installed = { 'lua', 'python', 'javascript', 'typescript', 'bash', 'markdown', 'markdown_inline', 'java' }, -- your languages
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false, -- disable legacy regex highlighting
      },
      indent = { enable = true }, -- better indentation
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  -- nvim-treesitter-textobjects (extended text objects)
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- automatically jump forward to next textobj
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['af'] = '@function.outer', -- around function
            ['if'] = '@function.inner', -- inside function
            ['ac'] = '@class.outer', -- around class
            ['ic'] = '@class.inner', -- inside class
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer', -- jump to next function start
            [']]'] = '@class.outer', -- jump to next class start
          },
          goto_next_end = {
            [']M'] = '@function.outer', -- jump to next function end
            [']['] = '@class.outer', -- jump to next class end
          },
          goto_previous_start = {
            ['[m'] = '@function.outer', -- jump to previous function start
            ['[['] = '@class.outer', -- jump to previous class start
          },
          goto_previous_end = {
            ['[M'] = '@function.outer', -- jump to previous function end
            ['[]'] = '@class.outer', -- jump to previous class end
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner', -- swap next parameter
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner', -- swap previous parameter
          },
        },
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
