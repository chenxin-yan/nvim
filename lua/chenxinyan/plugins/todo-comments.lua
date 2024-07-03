return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
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

    -- Open todo comment tree in builtin quckfix window
    vim.keymap.set('n', '<leader>T', ':exe ":TodoQuickFix keywords=TODO,FIX cwd=" .. fnameescape(expand("%:p"))<CR>', { desc = 'Open [T]odo [T]ree' })

    -- search todo comments via telescope
    vim.keymap.set('n', '<leader>st', ':TodoTelescope keywords=TODO,FIX<CR>', { desc = '[S]earch [T]odo tree' })
  end,
}
