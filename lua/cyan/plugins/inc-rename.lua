return { -- incremental renaming
  'smjonas/inc-rename.nvim',
  keys = {
    {
      '<leader>rn',
      ':IncRename ',
      desc = 'Rename',
    },
  },
  config = function()
    require('inc_rename').setup {
      save_in_cmdline_history = false,
    }
  end,
}
