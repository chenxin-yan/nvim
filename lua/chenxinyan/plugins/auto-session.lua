return {
  'rmagatti/auto-session',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('auto-session').setup {
      auto_session_suppress_dirs = { '~/', '~/Downloads', '/', '/Users' },
      session_lens = {
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
        buftypes_to_ignore = {},
      },

      vim.keymap.set('n', '<leader>ss', require('auto-session.session-lens').search_session, { desc = '[S]earch [S]ession' }),
      vim.keymap.set('n', '<leader>ws', ':SessionSave', { desc = '[W]orkspace [S]ave' }),
    }
  end,
}
