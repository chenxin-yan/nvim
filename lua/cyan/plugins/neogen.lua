return {
  'danymat/neogen',
  cmd = { 'Neogen' },
  keys = {
    { '<leader>cd', '<cmd>Neogen<cr>', desc = 'Generate [D]ostring' },
  },
  opts = {
    snippet_engine = 'luasnip',
  },
}
