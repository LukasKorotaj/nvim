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
      preset = 'none',
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<C-y>'] = { 'select_and_accept', 'fallback' },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

      -- Not needed as KK just goes into the docs
      --      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      --      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      -- Never use this
      --      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      --      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
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
