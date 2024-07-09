return { -- incremental renaming
  'smjonas/inc-rename.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('inc_rename').setup {
      save_in_cmdline_history = false,
    }
    vim.keymap.set('n', '<leader>cr', ':IncRename ', { desc = '[R]ename' })
  end,
}
