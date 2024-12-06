return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  lazy = true,
  opts = {},
  keys = {
    {
      '<leader>Q',
      function()
        require('persistence').stop()
      end,
      desc = "Don't Save Current Session",
    },
  },
}
