return {
  'rmagatti/auto-session',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  event = 'ExitPre',
  cmd = { 'SessionSave', 'SessionRestore', 'SessionSearch' },
  keys = {
    { '<leader>ws', '<cmd>SessionSearch<cr>', desc = 'Select Session' },
    { '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
  },
  opts = function()
    return {
      allowed_dirs = { vim.env.PROJECT_DIR .. '/*', vim.env.DEV_DIR .. '/*' },
      auto_restore = false,
      bypass_save_filetypes = { 'snacks_dashboard' },
      use_git_branch = true,
      session_lens = {
        load_on_setup = true,
        previewer = false,
        theme_conf = {
          border = true,
        },
      },
    }
  end,
  config = function(_, opts)
    require('auto-session').setup(opts)
    vim.cmd 'SessionPurgeOrphaned'
  end,
}
