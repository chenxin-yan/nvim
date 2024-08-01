return {
  'folke/which-key.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    spec = {
      { ']', group = 'Next' },
      { '[', group = 'Previous' },
      { 'gs', group = 'Surround', mode = { 'n', 'x' } },
      { '<leader>c', group = '󰘦 [C]ode', mode = { 'n', 'x' } },
      { '<leader>cs', group = '[S]wap' },
      { '<leader>cd', group = '[D]ebug Print', mode = { 'n', 'x' } },
      { '<leader>d', group = ' [D]bug' },
      { '<leader>s', group = ' [S]earch' },
      { '<leader>w', group = ' [W]orkspace' },
      { '<leader>t', group = '󰔡 [T]oggle' },
      { '<leader>g', group = ' [G]it' },
      { '<leader>h', group = ' [H]unk', mode = { 'n', 'x' } },
      { '<leader>b', group = ' [B]uffer' },
      { '<leader>r', group = ' [R]efactor', mode = { 'n', 'x' } },
    },
    plugins = {
      spelling = {
        enabled = false,
      },
      presets = {
        windows = false,
        nav = false,
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
