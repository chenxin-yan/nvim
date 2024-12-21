return {
  'folke/zen-mode.nvim',
  cmd = { 'ZenMode' },
  keys = {
    { '<leader>uz', '<cmd>ZenMode<cr>', desc = 'Toggle [Z]en mode' },
  },
  opts = {
    window = {
      options = {
        signcolumn = 'no',
        number = false,
        relativenumber = false,
      },
    },
    plugins = {
      gitsigns = { enabled = true },
    },
  },
}
