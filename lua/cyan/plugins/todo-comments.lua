return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  keys = {
    { '<leader>xt', '<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>', desc = '[T]odos' },
    {
      '<leader>xT',
      '<cmd>Trouble todo toggle<cr>',
      desc = 'Highlighted Comments',
    },
    { '<leader>st', '<cmd>TodoFzflua keywords=TODO,FIXME,FIX<cr>', desc = '[T]odos' },
    {
      '<leader>sT',
      '<cmd>TodoFzflua><cr>',
      desc = 'Highlighted Comments',
    },
  },
  config = function()
    require('todo-comments').setup()
    -- jump between todo comments
    vim.keymap.set('n', ']t', function()
      require('todo-comments').jump_next()
    end, { desc = 'Next todo comment' })
    vim.keymap.set('n', '[t', function()
      require('todo-comments').jump_prev()
    end, { desc = 'Previous todo comment' })
  end,
}
