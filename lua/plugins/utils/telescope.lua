return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-symbols.nvim',
    },
    cmd = 'Telescope',
    keys = {
      {
        '<leader><space>',
        function()
          require('telescope.builtin').find_files()
        end,
        desc = 'Find project files',
      },
      {
        '<leader>/',
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = 'Grep (root dir)',
      },
      {
        '<leader>:',
        function()
          require('telescope.builtin').command_history()
        end,
        desc = 'Command History',
      },
      {
        '<leader>b',
        function()
          require('telescope.builtin').buffers()
        end,
        desc = '+buffer',
      },
      {
        '<leader>ff',
        function()
          require('telescope.builtin').find_files()
        end,
        desc = 'Find project files',
      },
      {
        '<leader>fr',
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = 'Find text',
      },
      {
        '<leader>fR',
        function()
          require('telescope.builtin').resume()
        end,
        desc = 'Resume',
      },
      {
        '<leader>fg',
        function()
          require('telescope.builtin').oldfiles()
        end,
        desc = 'Recent',
      },
      {
        '<leader>fb',
        function()
          require('telescope.builtin').buffers()
        end,
        desc = 'Buffers',
      },
      {
        '<C-g>',
        function()
          require('telescope.builtin').git_files()
        end,
        desc = 'Search git files',
      },
      {
        '<leader>gc',
        function()
          require('telescope.builtin').git_commits()
        end,
        desc = 'Commits',
      },
      {
        '<leader>gs',
        function()
          require('telescope.builtin').git_status()
        end,
        desc = 'Status',
      },
      {
        '<leader>sa',
        function()
          require('telescope.builtin').autocommands()
        end,
        desc = 'Auto Commands',
      },
      {
        '<leader>sb',
        function()
          require('telescope.builtin').current_buffer_fuzzy_find()
        end,
        desc = 'Buffer',
      },
      {
        '<leader>sc',
        function()
          require('telescope.builtin').command_history()
        end,
        desc = 'Command History',
      },
      {
        '<leader>sC',
        function()
          require('telescope.builtin').commands()
        end,
        desc = 'Commands',
      },
      {
        '<leader>sD',
        function()
          require('telescope.builtin').diagnostics()
        end,
        desc = 'Workspace diagnostics',
      },
      {
        '<leader>sh',
        function()
          require('telescope.builtin').help_tags()
        end,
        desc = 'Help pages',
      },
      {
        '<leader>sH',
        function()
          require('telescope.builtin').highlights()
        end,
        desc = 'Search Highlight Groups',
      },
      {
        '<leader>sk',
        function()
          require('telescope.builtin').keymaps()
        end,
        desc = 'Keymaps',
      },
      {
        '<leader>sM',
        function()
          require('telescope.builtin').man_pages()
        end,
        desc = 'Man pages',
      },
      {
        '<leader>sm',
        function()
          require('telescope.builtin').marks()
        end,
        desc = 'Jump to Mark',
      },
      {
        '<leader>so',
        function()
          require('telescope.builtin').vim_options()
        end,
        desc = 'Options',
      },
      {
        '<leader>sR',
        function()
          require('telescope.builtin').resume()
        end,
        desc = 'Resume',
      },
      {
        '<leader>uC',
        function()
          require('telescope.builtin').colorscheme()
        end,
        desc = 'Colorscheme preview',
      },
      {
        '<leader>fs',
        function()
          require('telescope.builtin').symbols { source = { 'emoji' } }
        end,
        desc = 'Symbols',
      },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          layout_config = {
            horizontal = {
              prompt_position = 'top',
            },
          },
          sorting_strategy = 'ascending',
        },
        extensions = {
          file_browser = {
            hidden = true,
            grouped = true,
          },
          fzf = {
            fuzzy = true,
          },
          ['ui_select'] = {},
        },
      }
      require('telescope').load_extension 'file_browser'
      require('telescope').load_extension 'fzf'
      require('telescope').load_extension 'ui-select'
    end,
  },
}
