return {
  'sindrets/diffview.nvim',
  command = { 'DiffviewOpen', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = 'Git [S]tatus (DiffView)' },
    { '<leader>gl', '<cmd>DiffviewFileHistory<CR>', desc = 'Git [L]og' },
  },
}
