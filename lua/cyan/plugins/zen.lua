return {
  {
    'folke/zen-mode.nvim',
    dependencies = {
      -- {
      --   'folke/twilight.nvim',
      --   cmd = { 'Twilight' },
      --   keys = {
      --     { '<leader>tt', '<cmd>Twilight<cr>', desc = '[T]oggle [T]wilight' },
      --   },
      --   opts = {
      --     dimming = {
      --       alpha = 0.45,
      --     },
      --   },
      -- },
    },
    cmd = { 'ZenMode' },
    keys = {
      { '<leader>tz', '<cmd>ZenMode<cr>', desc = '[T]oggle [Z]en mode' },
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
