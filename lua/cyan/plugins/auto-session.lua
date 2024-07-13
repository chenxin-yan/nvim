return {
  {
    'rmagatti/auto-session',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_restore_enabled = false,
        auto_session_suppress_dirs = { '~/', '~/Downloads', '/' },
        session_lens = {
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
          buftypes_to_ignore = {}, -- list of buffer types that should not be deleted from current session when a new one is loaded
        },
      }
    end,

    vim.keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = '[W]orkspace [R]estore for current directory' }),
    vim.keymap.set('n', '<leader>wS', '<cmd>SessionSave<CR>', { desc = '[W]orkspace [S]ave' }),
    vim.keymap.set('n', '<leader>sW', '<cmd>Telescope session-lens<CR>', { desc = '[S]earch [W]orkspace', noremap = true }),
  },
}
