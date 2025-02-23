return {
  'dmmulroy/tsc.nvim',
  cmd = { 'TSC' },
  opts = {
    -- support monorepo
    flags = {
      build = true,
    },
  },
  keys = {
    { '<leader>ck', '<cmd>TSC<CR>', desc = 'Check TypeScript error' },
  },
}
