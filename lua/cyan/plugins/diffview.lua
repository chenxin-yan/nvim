return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  keys = {
    {
      '<leader>gd',
      desc = '+Diffview',
    },
    { '<leader>gdb', '<cmd>DiffviewOpen origin/HEAD...HEAD --imply-local<cr>', desc = 'Git [D]iff [B]ranch' },
    { '<leader>gdB', '<cmd>DiffviewFileHistory --range=origin/HEAD...HEAD --right-only --no-merges<cr>', desc = 'Git [D]iff [B]ranch files' },
    { '<leader>gdc', '<cmd>DiffviewOpen<cr>', desc = 'Git [D]iff [C]onflicts' },
    { '<leader>gds', '<cmd>DiffviewFileHistory -g --range=stash<cr>', desc = 'Git [D]iff [S]tash' },
  },
}
