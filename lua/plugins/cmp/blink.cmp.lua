return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'folke/lazydev.nvim',
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
    },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = {
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
      trigger = {
        show_on_backspace = true,
      },
      list = {},
      menu = {
        auto_show = true,
      },
    },

    sources = {
      default = { 'lsp', 'path', 'buffer', 'snippets', 'lazydev', 'obsidian_tags', 'obsidian', 'obsidian_new' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        obsidian = { module = 'obsidian.completion.sources.blink.refs', max_items = 10 },
        obsidian_new = { module = 'obsidian.completion.sources.blink.new', max_items = 2 },
        obsidian_tags = { module = 'obsidian.completion.sources.blink.tags', max_items = 10 },
        buffer = { max_items = 10 },
      },
      min_keyword_length = 2,
    },
    term = {
      enabled = true,
    },

    --snippets = { preset = 'luasnip' },

    -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
    -- which automatically downloads a prebuilt binary when enabled.
    --
    -- By default, we use the Lua implementation instead, but you may enable
    -- the rust implementation via `'prefer_rust_with_warning'`
    --
    -- See :h blink-cmp-config-fuzzy for more information
    fuzzy = { implementation = 'prefer_rust_with_warning' },

    signature = { enabled = true },
  },
}
