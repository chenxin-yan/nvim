return {
  'tpope/vim-fugitive',
  cmd = 'Git',
  keys = {
    { '<leader>ga', ':Git add *', desc = '[G]it [A]dd' },
    { '<leader>gc', ':Git commit -m ""<left>', desc = '[G]it commit' },
    { '<leader>gA', ':Git commit --amend --no-edit', desc = '[G]it [A]mend' },
    { '<leader>gp', ':Git push', desc = '[G]it [P]ush' },
    { '<leader>gr', ':Git reset HEAD *', desc = '[G]it [R]eset' },
  },
}
