return {
  'olimorris/persisted.nvim',
  cmd = {
    'SessionToggle',
    'SessionSave',
    'SessionSelect',
    'SessionLoad',
    'SessionLoadLast',
    'SessionDelete',
  },
  config = function()
    local persisted = require 'persisted'
    local utils = require 'persisted.utils'
    local allowed_dirs = {
      vim.env.DEV_DIR,
      vim.env.PROJECT_DIR,
    }

    persisted.setup {
      use_git_branch = true,
      should_save = function()
        if vim.bo.filetype == 'alpha' then
          return false
        end
        return utils.dirs_match(vim.fn.getcwd(), allowed_dirs)
      end,
    }
  end,
}
