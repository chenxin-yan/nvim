local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt
local extras = require 'luasnip.extras'
local rep = extras.rep

return {
  s({ trig = '*', desc = 'Reset Properties' }, {
    t '* {',
    t { '', '  margin: 0;' },
    t { '', '  padding: 0;' },
    t { '', '  box-sizing: border-box;' },
    t { '', '}' },
  }),
}
