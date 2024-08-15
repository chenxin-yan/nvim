---@type LazySpec
return {
  'mikavilpas/yazi.nvim',
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
      desc = 'Open the file [E]xplorer (Yazi)',
    },
  },
  ---@type YaziConfig
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,

    -- enable these if you are using the latest version of yazi
    -- use_ya_for_events_reading = true,
    -- use_yazi_client_id_flag = true,

    keymaps = {
      show_help = '<f1>',
    },
  },
}
