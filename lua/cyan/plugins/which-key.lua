return {
  'folke/which-key.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    spec = {
      { 'g', group = '[G]oto' },
      { 'z', group = 'Fold' },
      { ']', group = 'Next' },
      { '[', group = 'Previous' },
      { 's', group = '[S]urround' },
      { '<leader>c', group = '󰘦 [C]ode' },
      { '<leader>d', group = '󰈙 [D]ocument' },
      { '<leader>s', group = ' [S]earch' },
      { '<leader>w', group = ' [W]orkspace' },
      { '<leader>t', group = '󰔡 [T]oggle' },
      { '<leader>g', group = ' [G]it' },
      { '<leader>h', group = ' [H]unk' },
      { '<leader>b', group = ' [B]uffer' },
      { '<leader>x', group = ' [X]Diagnostics/Quickfix' },
    },
    plugins = {
      spelling = {
        enabled = false,
      },
    },
    modes = {
      t = false,
    },
    icons = {
      rules = false,
    },
    ignore_missing = true,
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)
  end,
}
