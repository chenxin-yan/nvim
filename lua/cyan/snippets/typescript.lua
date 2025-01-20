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
  s('cl', {
    t 'console.log(',
    i(1),
    t { ')' },
  }),
  s('ed', {
    t 'export default ',
  }),
}
