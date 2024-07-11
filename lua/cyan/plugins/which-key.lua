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
      group = '+ ',
    },
    ignore_missing = true,
    defaults = {
      ['g'] = { name = '[G]oto' },
      ['z'] = { name = 'Fold' },
      [']'] = { name = 'Next' },
      ['['] = { name = 'Previous' },
      ['s'] = { name = '[S]urround' },

      ['<leader>c'] = { name = '󰘦 [C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '󰈙 [D]ocument', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = ' [S]earch', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = ' [W]orkspace', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '󰔡 [T]oggle', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = ' [G]it', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = ' [H]unk', _ = 'which_key_ignore' },
      ['<leader>b'] = { name = ' [B]uffer', _ = 'which_key_ignore' },
      ['<leader>x'] = { name = ' [X]Diagnostics/Quickfix', _ = 'which_key_ignore' },
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.register(opts.defaults)
  end,
}