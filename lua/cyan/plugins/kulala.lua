return {
  'mistweaverco/kulala.nvim',
  ft = 'http',
  init = function()
    vim.filetype.add {
      extension = {
        ['http'] = 'http',
      },
    }
  end,
  keys = {
    { '<leader>Rb', "<cmd>lua require('kulala').scratchpad()<cr>", desc = 'Open scratchpad', ft = 'http', buffer = 0 },
    { '<leader>Rc', "<cmd>lua require('kulala').copy()<cr>", desc = 'Copy as cURL', ft = 'http', buffer = 0 },
    { '<leader>RC', "<cmd>lua require('kulala').from_curl()<cr>", desc = 'Paste from curl', ft = 'http', buffer = 0 },
    {
      '<leader>Rg',
      "<cmd>lua require('kulala').download_graphql_schema()<cr>",
      desc = 'Download GraphQL schema',
      ft = 'http',
      buffer = 0,
    },
    { '<leader>Ri', "<cmd>lua require('kulala').inspect()<cr>", desc = 'Inspect current request', ft = 'http', buffer = 0 },
    { '<leader>Rn', "<cmd>lua require('kulala').jump_next()<cr>", desc = 'Jump to next request', ft = 'http', buffer = 0 },
    { '<leader>Rp', "<cmd>lua require('kulala').jump_prev()<cr>", desc = 'Jump to previous request', ft = 'http', buffer = 0 },
    { '<leader>Rr', "<cmd>lua require('kulala').replay()<cr>", desc = 'Replay the last request', ft = 'http', buffer = 0 },
    { '<leader>Rs', "<cmd>lua require('kulala').run()<cr>", desc = 'Send the request', ft = 'http', buffer = 0 },
    { '<leader>RS', "<cmd>lua require('kulala').show_stats()<cr>", desc = 'Show stats', ft = 'http', buffer = 0 },
    { '<leader>Rt', "<cmd>lua require('kulala').toggle_view()<cr>", desc = 'Toggle headers/body', ft = 'http', buffer = 0 },
  },
  opts = {},
}
