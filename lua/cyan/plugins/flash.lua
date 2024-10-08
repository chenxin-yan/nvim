return {
  'folke/flash.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  lazy = true,
  ---@type Flash.Config
  opts = {},
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
      mode = { 'n', 'o', 'x' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
    },
    {
      'r',
      mode = 'o',
      function()
        require('flash').remote()
      end,
      desc = 'Remote Flash',
    },
    {
      'R',
      mode = { 'o', 'x' },
      function()
        require('flash').treesitter_search()
      end,
      desc = 'Treesitter Search',
    },
    {
      '<c-s>',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump {
          search = { mode = 'search', max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = '^',
        }
      end,
      desc = 'Flash to a line',
    },
    {
      '<leader>*',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump {
          pattern = vim.fn.expand '<cword>',
        }
      end,
      desc = 'Flash with word under cursor',
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
