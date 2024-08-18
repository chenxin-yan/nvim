return {
  'gaoDean/autolist.nvim',
  ft = {
    'markdown',
    'text',
  },
  dependencies = {
    -- autopairs has to be loaded before autolist to avoid conflict
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      -- Optional dependency
      dependencies = { 'hrsh7th/nvim-cmp' },
      config = function()
        require('nvim-autopairs').setup {}
        -- If you want to automatically add `(` after selecting a function or method
        local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        local cmp = require 'cmp'
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end,
    },
  },
  config = function()
    require('autolist').setup()
    vim.keymap.set('i', '<tab>', '<cmd>AutolistTab<cr>')
    vim.keymap.set('i', '<s-tab>', '<cmd>AutolistShiftTab<cr>')
    vim.keymap.set('i', '<CR>', '<CR><cmd>AutolistNewBullet<cr>')
    vim.keymap.set('n', 'o', 'o<cmd>AutolistNewBullet<cr>')
    vim.keymap.set('n', 'O', 'O<cmd>AutolistNewBulletBefore<cr>')
    vim.keymap.set('n', '<CR>', '<cmd>AutolistToggleCheckbox<cr><CR>')
  end,
}
