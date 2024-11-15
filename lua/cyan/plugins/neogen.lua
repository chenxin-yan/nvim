return {
  'danymat/neogen',
  cmd = 'Neogen',
  keys = {
    {
      '<leader>cn',
      function()
        ---@diagnostic disable-next-line: missing-parameter
        require('neogen').generate()
      end,
      desc = 'Generate Annotation with Neogen',
    },
  },
  opts = {
    snippet_engine = 'luasnip',
  },
}
