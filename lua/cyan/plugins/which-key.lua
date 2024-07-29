return {
  'folke/which-key.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    spec = {
      { ']', group = 'Next' },
      { '[', group = 'Previous' },
      { '<leader>c', group = '󰘦 [C]ode' },
      { '<leader>d', group = ' [D]iagnostics' },
      { '<leader>s', group = ' [S]earch' },
      { '<leader>w', group = ' [W]orkspace' },
      { '<leader>t', group = '󰔡 [T]oggle' },
      { '<leader>g', group = ' [G]it' },
      { '<leader>h', group = ' [H]unk' },
      { '<leader>b', group = ' [B]uffer' },
      { '<leader>r', group = ' [R]efactor' },
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
    keys = {
      scroll_down = '<c-s-d>', -- binding to scroll down inside the popup
      scroll_up = '<c-s-u>', -- binding to scroll up inside the popup
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)

    vim.keymap.set({ 'n', 'x' }, '<leader>?', function()
      require('which-key').show { global = false }
    end, { desc = 'Buffer Local Keymaps (which-key)' })
  end,
}
