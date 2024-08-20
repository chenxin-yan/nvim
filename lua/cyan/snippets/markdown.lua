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
  s('info', {
    t '> [!Info] ',
    i(1),
    t { '', '> ' },
    i(0),
  }),
  s('ex', {
    t '> [!Example] ',
    i(1),
    t { '', '> ' },
    i(0),
  }),
  s('tip', {
    t '> [!Tip] ',
    i(1),
    t { '', '> ' },
    i(0),
  }),
  s('warn', {
    t '> [!Warning] ',
    i(1),
    t { '', '> ' },
    i(0),
  }),
  s('![', {
    t '![',
    i(0),
    t '](',
    i(1),
    t ')',
  }),
  s('<!', {
    t '<!--- ',
    i(0),
    t ' -->',
  }),
}
