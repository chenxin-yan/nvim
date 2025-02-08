return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'helix',
    spec = {
      { ']', group = 'Next' },
      { '[', group = 'Previous' },
      { 'gs', group = 'Surround', mode = { 'n', 'x' } },
      { '<leader>c', group = '󰘦 Code', mode = { 'n', 'x' } },
      { '<leader>x', group = ' Diagnostic/QuickFix' },
      { '<leader>t', group = ' Testing' },
      { '<leader>d', group = ' Debug' },
      { '<leader>s', group = ' Search' },
      { '<leader>u', group = '󰔡 Toggle' },
      { '<leader>g', group = ' Git' },
      { '<leader>h', group = ' Hunk', mode = { 'n', 'x' } },
      { '<leader>b', group = ' Buffer' },
      { '<leader>r', group = ' Refactor', mode = { 'n', 'x' } },
      { '<leader>C', group = '󰗧 Cursors' },
      { '<leader>o', group = ' Obsidian' },
      { '<leader>j', group = ' Jobs' },
      { '<leader>w', group = ' Session' },
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
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)

    vim.keymap.set({ 'n', 'x' }, '<leader>?', function()
      require('which-key').show { global = false }
    end, { desc = 'Buffer Local Keymaps (which-key)' })
  end,
}
