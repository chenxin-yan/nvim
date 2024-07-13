return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    plugins = {
      spelling = {
        enabled = false,
      },
    },
    icons = {
      rules = false,
    },
    ignore_missing = true,
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)
    wk.add {
      {
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
    }
  end,
}
