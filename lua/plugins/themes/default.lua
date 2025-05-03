return {
  "folke/tokyonight.nvim",
  lazy = false,    -- make sure we load this during startup
  priority = 1000, -- load this before all other plugins
  opts = {
    style = "night", -- "day", "night", "moon", or "storm"
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = "transparent", -- for neotree, etc.
      floats = "transparent",   -- for telescope, etc.
    },
    on_colors = function(colors)
      -- Customize colors (similar to custom_highlights in catppuccin)
      colors.cursor_line_nr = colors.orange
    end,
    on_highlights = function(hl, colors)
      -- Custom highlights
      hl.CursorLineNr = { fg = colors.orange }
      hl.NavicText = { fg = colors.fg }
      -- You can add more custom highlights here
    end,
    -- Integrations (similar to catppuccin)
    integrations = {
      gitsigns = true,
      neotree = true,
      which_key = true,
      telescope = {
        enabled = true,
        style = "transparent", -- or "borderless"
      },
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          information = { "underline" },
          warnings = { "underline" },
        },
      },
      -- Tokyonight doesn't have all the same integrations as catppuccin,
      -- but these are the most common ones
      cmp = true,
      treesitter = true,
      notify = true,
      mini = {
        enabled = true,
      },
    },
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme("tokyonight") -- apply the colorscheme
  end,
}
