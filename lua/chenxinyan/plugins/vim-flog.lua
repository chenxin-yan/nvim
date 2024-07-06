return {
  'rbong/vim-flog',
  dependencies = {
    'tpope/vim-fugitive',
  },
  cmd = { 'Flog', 'Flogsplit', 'Floggit' },
  keys = {
    { '<leader>gg', ':Flog<CR>', desc = '[G]it [G]raph' },
  },
}
