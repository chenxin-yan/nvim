return {
  'mikavilpas/yazi.nvim',
  -- dir = '~/dev/yazi.nvim/',
  keys = {
    {
      '-',
      '<cmd>Yazi<cr>',
      desc = 'Open yazi at the current file',
    },
    {
      -- Open in the current working directory
      '<leader>e',
      '<cmd>Yazi cwd<cr>',
      desc = "Open the file manager in nvim's working directory",
    },
  },
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      replace_in_directory = '<c-r>',
      grep_in_directory = '<c-g>',
      change_working_directory = '`',
    },
  },
}
