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
    {}
    Back: {}
    END
    ]],
        {
          i(1, 'Front'),
          i(2, 'Back'),
        }
      )
    ),
  }),
}
