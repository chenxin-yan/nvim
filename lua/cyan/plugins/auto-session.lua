return {
  {
    'rmagatti/auto-session',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    event = 'BufReadPre',
    cmd = { 'SessionSave', 'SessionRestore', 'SessionSearch' },
    keys = {
      { '<leader>wr', '<cmd>SessionRestore<cr>', desc = 'Session: [W]orkspace [R]estore for current directory' },
      { '<leader>wS', '<cmd>SessionSave<cr>', desc = 'Session: [W]orkspace [S]ave' },
      { '<leader>wc', '<cmd>SessionPurgeOrphaned<cr>', desc = 'Session: [W]orkspace [C]lear' },
      { '<leader>ws', '<cmd>SessionSearch<cr>', desc = 'Session: [W]orkspace [S]earch' },
    },
    config = function()
      require('auto-session').setup {
        auto_restore_enabled = false,
        auto_session_allowed_dirs = { '~/dev/*' },
        session_lens = {
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
        bypass_session_save_file_types = { 'alpha' },
      }
    end,
  },
}
