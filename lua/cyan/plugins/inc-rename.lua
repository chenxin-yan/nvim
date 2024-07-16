return { -- incremental renaming
  'smjonas/inc-rename.nvim',
  keys = {
    {
      '<leader>cr',
      ':IncRename ',
      desc = '[R]ename',
    },
  },
  config = function()
    require('inc_rename').setup {
      save_in_cmdline_history = false,
    }
  end,
}
