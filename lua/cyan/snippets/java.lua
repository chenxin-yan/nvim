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
  s('sout', {
    t 'System.out.println(',
    i(1),
    t { ')' },
  }),
}
