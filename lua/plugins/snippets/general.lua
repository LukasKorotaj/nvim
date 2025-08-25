local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

-- Add a simple snippet
return {
  ls.add_snippets('markdown', {
    s(
      'anki',
      fmt(
        [[
    START
    Basic
    TARGET DECK: {}
    {}
    Back: {}

    END
    ]],
        {
          i(1, 'Deck'),
          i(2, 'Front'),
          i(3, 'Back'),
        }
      )
    ),
    s(
      'inline_anki',
      fmt([[STARTI Basic TARGET DECK: {} {} Back: {} ENDI]], {
        i(1, 'Deck'),
        i(2, 'Front'),
        i(3, 'Back'),
      })
    ),
  }),
}
