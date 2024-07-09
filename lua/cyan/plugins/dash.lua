return {
  'rizzatti/dash.vim',
  cmd = { 'Dash', 'DashKeywords' },
  keys = {
    { '<leader>cd', ':Dash ', desc = 'Start [D]ash search' },
    { '<leader>c*', '<Plug>DashGlobalSearch<CR>', desc = 'Search current word in Dash' },
  },
}
