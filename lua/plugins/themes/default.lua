return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'auto', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = 'dark',
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { 'italic' }, -- Change the style of comments
          conditionals = { 'italic' },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
        },
      }
      -- setup must be called before loading
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
--return {
--  "folke/tokyonight.nvim",
--  lazy = false,    -- make sure we load this during startup
--  priority = 1000, -- load this before all other plugins
--  opts = {
--    style = "night", -- "day", "night", "moon", or "storm"
--    transparent = true,
--    terminal_colors = true,
--    styles = {
--      comments = { italic = true },
--      keywords = { italic = true },
--      functions = {},
--      variables = {},
--      sidebars = "transparent", -- for neotree, etc.
--      floats = "transparent",   -- for telescope, etc.
--    },
--    on_colors = function(colors)
--      -- Customize colors (similar to custom_highlights in catppuccin)
--      colors.cursor_line_nr = colors.orange
--    end,
--    on_highlights = function(hl, colors)
--      -- Custom highlights
--      hl.CursorLineNr = { fg = colors.orange }
--      hl.NavicText = { fg = colors.fg }
--      -- You can add more custom highlights here
--    end,
--    -- Integrations (similar to catppuccin)
--    integrations = {
--      gitsigns = true,
--      neotree = true,
--      which_key = true,
--      telescope = {
--        enabled = true,
--        style = "transparent", -- or "borderless"
--      },
--      indent_blankline = {
--        enabled = true,
--        colored_indent_levels = false,
--      },
--      native_lsp = {
--        enabled = true,
--        underlines = {
--          errors = { "underline" },
--          hints = { "underline" },
--          information = { "underline" },
--          warnings = { "underline" },
--        },
--      },
--      -- Tokyonight doesn't have all the same integrations as catppuccin,
--      -- but these are the most common ones
--      cmp = true,
--      treesitter = true,
--      notify = true,
--      mini = {
--        enabled = true,
--      },
--    },
--  },
--  config = function(_, opts)
--    require("tokyonight").setup(opts)
--    vim.cmd.colorscheme("tokyonight") -- apply the colorscheme
--  end,
--}
