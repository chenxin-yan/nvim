return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    spec = {
      { ']', group = 'Next' },
      { '[', group = 'Previous' },
      { 'gs', group = 'Surround', mode = { 'n', 'x' } },
      { '<leader>a', group = ' AI', mode = { 'n', 'x' } },
      { '<leader>c', group = '󰘦 Code', mode = { 'n', 'x' } },
      { '<leader>x', group = ' Diagnostic/QuickFix' },
      { '<leader>t', group = ' Test' },
      { '<leader>d', group = ' Debug' },
      { '<leader>s', group = ' Search' },
      { '<leader>u', group = '󰔡 Toggle' },
      { '<leader>g', group = ' Git' },
      { '<leader>h', group = ' Hunk', mode = { 'n', 'x' } },
      { '<leader>b', group = ' Buffer' },
      { '<leader>r', group = ' Refactor', mode = { 'n', 'x' } },
      { '<leader>o', group = ' Obsidian' },
    },
    plugins = {
      spelling = {
        enabled = false,
      },
      presets = {
        windows = false,
        nav = false,
      },
    },
    icons = {
      rules = false,
      mappings = false,
    },
    keys = {
      scroll_down = '<M-d>', -- binding to scroll down inside the popup
      scroll_up = '<M-u>', -- binding to scroll up inside the popup
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
