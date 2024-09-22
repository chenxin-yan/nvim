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
      { '<leader>wc', '<cmd>SessionPurgeOrphaned<cr>', desc = 'Session: [W]orkspace [C]lean up' },
      { '<leader>sw', '<cmd>SessionSearch<cr>', desc = 'Session: [W]orkspace' },
    },
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      allowed_dirs = { '~/dev/*', '/Users/yanchenxin/Library/Mobile Documents/com~apple~CloudDocs/PARA/Projects/*' },
      auto_restore = false,
      bypass_save_filetypes = { 'alpha' },
      session_lens = {
        load_on_setup = true,
        previewer = false,
        theme_conf = {
          border = true,
        },
      },
    },
  },
}
