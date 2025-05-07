return {
  {
    'SmiteshP/nvim-navic',
    lazy = true,
    dependencies = { 'neovim/nvim-lspconfig' }, -- Ensure LSP is available
    opts = {
      separator = '  ', -- or " > " if preferred
      highlight = true, -- Enable syntax highlighting
      depth_limit = 5, -- Max depth for breadcrumbs
      icons = {
        File = ' ', -- File icon
        Module = ' ', -- Module/Namespace
        Namespace = '󰌗 ', -- Namespace
        Package = ' ', -- Package
        Class = '󰌗 ', -- Class
        Method = '󰆧 ', -- Method
        Property = ' ', -- Property/Field
        Field = ' ', -- Field
        Constructor = ' ', -- Constructor
        Enum = ' ', -- Enum
        Interface = ' ', -- Interface
        Function = '󰊕 ', -- Function
        Variable = '󰆦 ', -- Variable
        Constant = '󰏿 ', -- Constant
        String = '󰀬 ', -- String
        Number = '󰎠 ', -- Number
        Boolean = '◩ ', -- Boolean
        Array = '󰅪 ', -- Array
        Object = '󰅩 ', -- Object
        Key = '󰌋 ', -- Key
        Null = '󰟢 ', -- Null
        EnumMember = ' ', -- Enum Member
        Struct = '󰌗 ', -- Struct
        Event = ' ', -- Event
        Operator = '󰆕 ', -- Operator
        TypeParameter = '󰊄 ', -- Type Parameter
      },
    },
    init = function()
      -- Silence navic messages (avoids unnecessary notifications)
      vim.g.navic_silence = true

      -- Auto-attach to LSP clients with documentSymbol support
      local navic = require 'nvim-navic'
      local lsp_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end

      -- Use `LspAttach` event to safely attach navic
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local bufnr = args.buf
          lsp_attach(client, bufnr)
        end,
      })

      -- Optional: Set up winbar to display navic (if desired)
      --vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end,
  },
}
