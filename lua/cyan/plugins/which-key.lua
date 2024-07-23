return {
  'folke/which-key.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    spec = {
      { ']', group = 'Next' },
      { '[', group = 'Previous' },
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
      presets = {
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    icons = {
      rules = false,
      mappings = false,
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)
  end,
}
