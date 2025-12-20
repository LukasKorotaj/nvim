local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

-- Add a simple snippet
return {
  ls.add_snippets('markdown', {
    s(
      'dm',
      fmt(
        [[
    $$
    {}
    $$
    ]],
        {
          i(1, 'E = mc^2'),
        }
      )
    ),
  }),
}
