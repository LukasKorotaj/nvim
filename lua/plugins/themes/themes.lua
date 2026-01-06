local themes = {
  { repo = 'catppuccin/nvim', name = 'catppuccin', mode = 'dark' },
  { repo = 'catppuccin/nvim', name = 'catppuccin-latte', mode = 'light' },
  { repo = 'neanias/everforest-nvim', name = 'everforest', mode = 'dark' },
  { repo = 'ellisonleao/gruvbox.nvim', name = 'gruvbox', mode = 'dark' },
  { repo = 'rebelot/kanagawa.nvim', name = 'kanagawa', mode = 'dark' },
  { repo = 'tahayvr/matteblack.nvim', name = 'matteblack', mode = 'dark' },
  { repo = 'shaunsingh/nord.nvim', name = 'nord', mode = 'dark' },
  { repo = 'ribru17/bamboo.nvim', name = 'bamboo', mode = 'light' },
  { repo = 'rose-pine/neovim', name = 'rose-pine', mode = 'light' },
  { repo = 'folke/tokyonight.nvim', name = 'tokyonight', mode = 'dark' },
  { repo = 'gthelding/monokai-pro.nvim', name = 'monokai-pro-ristretto', mode = 'dark' },
  { repo = 'Mofiqul/dracula.nvim', name = 'dracula' },
  { repo = 'eldritch-theme/eldritch.nvim', name = 'eldritch' },
}

local theme_file = vim.fn.expand '$HOME/.config/nvim/lua/config/theme.txt'
local current_theme = ''
local f = io.open(theme_file, 'r')
if f then
  current_theme = f:read '*l'
  f:close()
end

local plugin_specs = {}
for _, theme in ipairs(themes) do
  table.insert(plugin_specs, {
    theme.repo,
    name = theme.name,
    lazy = false, -- install all themes immediately
    priority = 1000,
    config = function()
      -- only run config for the currently selected theme
      if theme.name == current_theme then
        if theme.config then
          theme.config()
        end
        vim.cmd.colorscheme(theme.name)
        vim.o.background = theme.mode or 'dark'
      end
    end,
  })
end

return plugin_specs
