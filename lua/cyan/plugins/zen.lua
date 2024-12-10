return {
  'folke/zen-mode.nvim',
  cmd = { 'ZenMode' },
  keys = {
    { '<leader>tz', '<cmd>ZenMode<cr>', desc = '[T]oggle [Z]en mode' },
  },
  opts = {
    plugins = {
      gitsigns = { enabled = true },
    },
  },
}
