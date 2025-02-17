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
    local function get_cwd_as_name()
      local dir = vim.fn.getcwd(0)
      return dir:gsub('[^A-Za-z0-9]', '_')
    end
    local overseer = require 'overseer'
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
      -- integration with overseer
      pre_save_cmds = {
        function()
          overseer.save_task_bundle(
            get_cwd_as_name(),
            -- Passing nil will use config.opts.save_task_opts. You can call list_tasks() explicitly and
            -- pass in the results if you want to save specific tasks.
            nil,
            { on_conflict = 'overwrite' } -- Overwrite existing bundle, if any
          )
        end,
      },
      -- Optionally get rid of all previous tasks when restoring a session
      pre_restore_cmds = {
        function()
          for _, task in ipairs(overseer.list_tasks {}) do
            task:dispose(true)
          end
        end,
      },
      post_restore_cmds = {
        function()
          overseer.load_task_bundle(get_cwd_as_name(), { ignore_missing = true })
        end,
      },
    }
  end,
  config = function(_, opts)
    require('auto-session').setup(opts)
    vim.cmd 'SessionPurgeOrphaned'
  end,
}
