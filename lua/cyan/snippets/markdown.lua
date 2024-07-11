local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
return {
  s('>', {
    t '> [!',
    c(1, {
      t 'Info',
      t 'Example',
      t 'Tip',
      t 'Warning',
    }),
    t '] ',
    i(2),
    t { '', '> ' },
    i(0),
  }),
}
