return {
  'danymat/neogen',
  cmd = 'Neogen',
  keys = {
    {
      '<leader>cA',
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require('neogen').generate()
      end,
      desc = 'Generate [A]nnotation',
    },
  },
  opts = {
    snippet_engine = 'luasnip',
  },
}
