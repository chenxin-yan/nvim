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
    t '> [!INFO] ',
    i(1),
    t { '', '> ' },
    i(0),
  }),
  s('ex', {
    t '> [!EXAMPLE] ',
    i(1),
    t { '', '> ' },
    i(0),
  }),
  s('tip', {
    t '> [!TIP] ',
    i(1),
    t { '', '> ' },
    i(0),
  }),
  s('warn', {
    t '> [!WARNING] ',
    i(1),
    t { '', '> ' },
    i(0),
  }),
  s('note', {
    t '> [!NOTE] ',
    i(1),
    t { '', '> ' },
    i(0),
  }),
  s('quote', {
    t '> [!QUOTE] ',
    i(1),
    t { '', '> ' },
    i(0),
  }),
  s('tldr', {
    t '> [!TLDR] ',
    i(1),
    t { '', '> ' },
    i(0),
  }),
  s('<!', {
    t '<!--- ',
    i(0),
    t ' -->',
  }),
  s('doc-meta', {
    t '---',
    t { '', 'title: "' },
    i(1),
    t { '"', 'author: [Chenxin Yan]' },
    t { '', 'date: "' },
    i(2),
    t { '"', '---', '' },
    i(0),
  }),
}
