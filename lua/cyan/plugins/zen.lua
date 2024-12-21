return {
  'folke/zen-mode.nvim',
  cmd = { 'ZenMode' },
  keys = {
    { '<leader>uz', '<cmd>ZenMode<cr>', desc = 'Toggle [Z]en mode' },
  },
  opts = {
    plugins = {
      gitsigns = { enabled = true },
    },
  },
}
