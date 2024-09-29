return {
  'rmagatti/auto-session',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  event = 'ExitPre',
  cmd = { 'SessionSave', 'SessionRestore', 'SessionSearch' },
  keys = {
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
  config = function(_, opts)
    require('auto-session').setup(opts)
    vim.cmd 'SessionPurgeOrphaned'
  end,
}
