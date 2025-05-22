return {
  'andrewferrier/debugprint.nvim',
  event = { 'VeryLazy' },
  keys = {
    { '<leader>sp', '<cmd>SearchDebugPrints<cr>', desc = 'Search debug prints' },
  },
  opts = {
    keymaps = {
      normal = {
        plain_below = '<leader>dpp',
        plain_above = '<leader>dpP',
        variable_below = '<leader>dpv',
        variable_above = '<leader>dpV',
        surround_plain = '<leader>dpsp',
        surround_variable = '<leader>dpsv',
        textobj_below = '<leader>dpo',
        textobj_above = '<leader>dpO',
        textobj_surround = '<leader>dpso',
        delete_debug_prints = '<leader>dpd',
      },
      insert = {
        plain = '<C-G>p',
        variable = '<C-G>v',
      },
      visual = {
        variable_below = '<leader>dpv',
        variable_above = '<leader>dpV',
      },
    },
  },
  version = '*',
}
