return {
  {
    'rmagatti/auto-session',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    event = 'VeryLazy',
    cmd = { 'SessionSave', 'SessionRestore', 'Telescope session_lens' },
    keys = {
      { '<leader>wr', '<cmd>SessionRestore<cr>', desc = 'Session: [W]orkspace [R]estore for current directory' },
      { '<leader>wS', '<cmd>SessionSave<cr>', desc = 'Session: [W]orkspace [S]ave' },
      { '<leader>wc', '<cmd>SessionPurgeOrphaned<cr>', desc = 'Session: [W]orkspace [C]lear' },
      { '<leader>sW', '<cmd>Telescope session-lens<cr>', desc = 'Session: [W]orkspace' },
    },
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_restore_enabled = false,
        auto_session_allowed_dirs = { '~/dev/*' },
        session_lens = {
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
      }
    end,
  },
}
