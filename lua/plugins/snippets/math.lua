return {
  'LukasKorotaj/luasnip-markdown-snippets.nvim',
  config = function()
    local ls = require 'luasnip'
    local t = ls.text_node
    local i = ls.insert_node
    local fmta = require('luasnip.extras.fmt').fmta
    local autosnippet = ls.extend_decorator.apply(ls.snippet, { snippetType = 'autosnippet' })
    local lms = require 'luasnip-markdown-snippets'

    require('luasnip-markdown-snippets').setup {
      snippets = {
        markdown = {
          -- Override existing snippet
          autosnippet(
            { trig = 'cb', wordTrig = false },
            { t '^3' }, -- original was ^3
            { condition = lms.in_math }
          ),

          autosnippet({ trig = '...', wordTrig = false }, { t '\\ldots' }, { condition = lms.in_math }),
          autosnippet({ trig = ' , ', wordTrig = false }, { t '\\qquad' }, { condition = lms.in_math }),
          autosnippet({ trig = '  ', wordTrig = false }, { t '\\quad' }, { condition = lms.in_math }),
        },
      },
    }
  end,
}
