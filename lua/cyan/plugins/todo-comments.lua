return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  config = function()
    require('todo-comments').setup()
    -- jump between todo comments
    vim.keymap.set('n', ']t', function()
      require('todo-comments').jump_next()
    end, { desc = 'Next todo comment' })
    vim.keymap.set('n', '[t', function()
      require('todo-comments').jump_prev()
    end, { desc = 'Previous todo comment' })

    -- open todo comments in quickfixlist
    vim.keymap.set('n', '<leader>xt', '<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>', { desc = '[T]odos' })
    vim.keymap.set('n', '<leader>xT', '<cmd>Trouble todo toggle<cr>', { desc = 'Highlighted Comments' })

    -- search todo comments via telescope
    vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope keywords=TODO,FIXME,FIX<cr>', { desc = '[T]odos' })
    vim.keymap.set('n', '<leader>sT', '<cmd>TodoTelescope<cr>', { desc = 'Highlighted Comments' })
  end,
}
