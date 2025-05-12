return {
  'mikavilpas/yazi.nvim',
  init = function()
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    -- vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
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
    keymaps = {
      replace_in_directory = '<c-r>',
      grep_in_directory = '<c-g>',
      change_working_directory = '`',
    },
  },
}
