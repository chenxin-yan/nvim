return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  lazy = true,
  opts = {},
  keys = {
    {
      '<leader>qr',
      function()
        require('persistence').load()
      end,
      desc = '[R]estore Session',
    },
    {
      '<leader>qs',
      function()
        require('persistence').select()
      end,
      desc = '[S]elect Session',
    },
    {
      '<leader>ql',
      function()
        require('persistence').load { last = true }
      end,
      desc = 'Restore [L]ast Session',
    },
    {
      '<leader>qd',
      function()
        require('persistence').stop()
      end,
      desc = "[D]on't Save Current Session",
    },
  },
}
