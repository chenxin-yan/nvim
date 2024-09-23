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
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump {
          pattern = '.', -- initialize pattern with any char
          search = {
            mode = function(pattern)
              -- remove leading dot
              if pattern:sub(1, 1) == '.' then
                pattern = pattern:sub(2)
              end
              -- return word pattern and proper skip pattern
              return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
            end,
          },
          -- select the range
          jump = { pos = 'range' },
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
      '<C-s>',
      mode = { 'c' },
      function()
        require('flash').toggle()
      end,
      desc = '[T]oggle Flash [S]earch',
    },
  },
}
