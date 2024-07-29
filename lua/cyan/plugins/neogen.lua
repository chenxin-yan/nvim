return {
  'danymat/neogen',
  cmd = 'Neogen',
  keys = {
    {
      '<leader>cd',
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require('neogen').generate()
      end,
      desc = 'Generate [D]ocumentation',
    },
  },
  opts = {
    snippet_engine = 'luasnip',
  },
}
