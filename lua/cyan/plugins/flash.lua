return {
  'folke/flash.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  lazy = true,
  ---@type Flash.Config
  opts = {
    modes = {
      search = {
        enabled = true,
      },
      char = {
        enabled = false,
      },
    },
  },
  keys = {
    {
      's',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
    },
    {
      'S',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
    },
    {
      '<C-/>',
      mode = { 'c' },
      function()
        require('flash').toggle()
      end,
      desc = '[T]oggle Flash [S]earch',
    },
  },
}
