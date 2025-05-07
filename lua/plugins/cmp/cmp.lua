return {
  {
    'hrsh7th/nvim-cmp',
    version = '*',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-emoji',
      'L3MON4D3/LuaSnip',
      'onsails/lspkind.nvim',
      'saadparwaiz1/cmp_luasnip',
    },
    opts = function(_, opts)
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require 'lspkind'

      -- Merge with default options
      opts = vim.tbl_deep_extend('force', opts, {
        formatting = {
          format = lspkind.cmp_format {
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
            show_labelDetails = true,
            symbol_map = {
              Text = '󰉿',
              Method = '󰆧',
              Function = '󰡱',
              Constructor = '',
              Field = '󰜢',
              Variable = '󰫧',
              Class = '󰠱',
              Interface = '',
              Module = '',
              Property = '󰜢',
              Unit = '󰑭',
              Value = '󰎠',
              Enum = '',
              Keyword = '󰌋',
              Snippet = '',
              Color = '󰏘',
              File = '󰈙',
              Reference = '󰈇',
              Folder = '󰉋',
              EnumMember = '',
              Constant = 'π',
              Struct = '󰙅',
              Event = '',
              Operator = '󰆕',
              TypeParameter = '',
            },
          },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'emoji' },
          { name = 'path' },
          { name = 'buffer', keyword_length = 3 },
          { name = 'r_language_server' },
          { name = 'texlab' },
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-k>'] = cmp.mapping.scroll_docs(-4),
          ['<C-j>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
        },
        performance = {
          max_view_entries = 6,
        },
        experimental = {
          ghost_text = false,
        },
      })

      return opts
    end,
  },
}
