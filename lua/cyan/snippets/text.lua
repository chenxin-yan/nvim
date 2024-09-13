local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt
local extras = require 'luasnip.extras'
local rep = extras.rep

return {
  s({ trig = 'hi', desc = 'Email template' }, {
    i(1),
    t { ',', '', '' },
    i(0),
    t { '', '', 'Sincerely,' },
    t { '', 'Chenxin (Cyan) Yan' },
  }),
}
