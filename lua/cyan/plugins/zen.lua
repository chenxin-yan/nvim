return {
  {
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
  },
  {
    'folke/zen-mode.nvim',
    cmd = { 'ZenMode' },
    keys = {
      { '<leader>tz', '<cmd>ZenMode<cr>', '[T]oggle [Z]en mode' },
    },
    opts = {
      plugins = {
        gitsigns = { enabled = true },
      },
      neovide = {
        enabled = vim.g.neovide,
      },
    },
  },
}
