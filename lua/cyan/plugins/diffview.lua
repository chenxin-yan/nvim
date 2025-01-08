return {
  'sindrets/diffview.nvim',
  command = { 'DiffviewOpen', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gS', '<cmd>DiffviewOpen<CR>', desc = 'Git [S]tatus (DiffView)' },
    { '<leader>gl', '<cmd>DiffviewFileHistory<CR>', desc = 'Git [L]og' },
  },
}
