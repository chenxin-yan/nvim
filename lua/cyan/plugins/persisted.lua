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
  opts = {
    use_git_branch = true,
    should_save = function()
      if vim.bo.filetype == 'alpha' then
        return false
      end
      return true
    end,
    ignored_dirs = {
      { '~', exact = true },
    },
  },
}
