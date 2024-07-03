return {
  'rbong/vim-flog',
  dependencies = {
    'tpope/vim-fugitive',
  },
  cmd = { 'Flog', 'Flogsplit', 'Floggit' },
  keys = {
    { '<leader>wg', ':Flog<CR>', desc = 'Show workspace [G]it graph' },
  },
}
