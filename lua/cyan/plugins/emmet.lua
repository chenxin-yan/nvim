return {
  'olrtg/nvim-emmet',
  keys = {
    {
      '<leader>ce',
      "<cmd>lua require('nvim-emmet').wrap_with_abbreviation()<cr>",
      desc = 'Use emmet',
      mode = { 'n', 'v' },
    },
  },
}
