return {
  'folke/twilight.nvim',
  cmd = { 'Twilight' },
  keys = {
    { '<leader>tt', '<cmd>Twilight<cr>', '[T]oggle [T]wilight' },
  },
  opts = {
    dimming = {
      alpha = 0.45,
    },
    context = 15,
  },
}
