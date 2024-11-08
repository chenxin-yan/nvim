return {
  'cbochs/grapple.nvim',
  opts = {
    scope = 'git_branch',
  },
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = 'Grapple',
  keys = {
    { '<leader>m', '<cmd>Grapple toggle<cr>', desc = '[M]ark File' },
    { '<leader>M', '<cmd>Grapple toggle_tags<cr>', desc = 'Open [M] window' },
    { '<C-S-n>', '<cmd>Grapple cycle_tags next<cr>', desc = 'Grapple cycle next tag' },
    { '<C-S-p>', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Grapple cycle previous tag' },
    { '<leader>1', '<cmd>Grapple select index=1<cr>', desc = 'Select tag 1' },
    { '<leader>2', '<cmd>Grapple select index=2<cr>', desc = 'Select tag 2 ' },
    { '<leader>3', '<cmd>Grapple select index=3<cr>', desc = 'Select tag 3' },
    { '<leader>4', '<cmd>Grapple select index=4<cr>', desc = 'Select tag 4' },
    { '<leader>5', '<cmd>Grapple select index=5<cr>', desc = 'Select tag 5' },
  },
}
