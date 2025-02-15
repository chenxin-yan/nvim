return {
  'danymat/neogen',
  cmd = { 'Neogen' },
  keys = {
    { 'n', '<leader>cd', '<cmd>Neogen<cr>', { desc = 'Generate [D]ostring' } },
  },
  opts = {
    snippet_engine = 'luasnip',
  },
}
