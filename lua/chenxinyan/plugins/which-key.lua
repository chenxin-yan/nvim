return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    plugins = {
      spelling = {
        enabled = false,
      },
    },
    defaults = {
      ['g'] = { name = '[G]oto' },
      ['z'] = { name = 'Fold' },
      [']'] = { name = 'Next' },
      ['['] = { name = 'Previous' },
      ['s'] = { name = '[S]urround' },
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
      ['<leader>b'] = { name = '[B]uffer' },
      ['<leader>x'] = { name = '[X]Diagnostics/Quickfix' },
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
