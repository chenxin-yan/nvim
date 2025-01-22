local M = {}

M.find_files_from_project_git_root = function()
  local function is_git_repo()
    vim.fn.system 'git rev-parse --is-inside-work-tree'
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir('.git', '.;')
    return vim.fn.fnamemodify(dot_git_path, ':h')
  end

  local opts = {
    find_command = {
      'rg',
      '--files',
      '--hidden',
      '--glob',
      '!**/.git/*',
    },
  }

  if is_git_repo() then
    opts = vim.tbl_deep_extend('force', opts, {
      cwd = get_git_root(),
    })
  end

  require('telescope.builtin').find_files(opts)
end

M.live_grep_from_project_git_root = function()
  local function is_git_repo()
    vim.fn.system 'git rev-parse --is-inside-work-tree'

    return vim.v.shell_error == 0
  end

  local function get_git_root()
    local dot_git_path = vim.fn.finddir('.git', '.;')
    return vim.fn.fnamemodify(dot_git_path, ':h')
  end

  local opts = {
    -- additional_args = {
    --   '--hidden',
    --   '--glob',
    --   '!**/.git/*',
    -- },
  }

  if is_git_repo() then
    opts = vim.tbl_deep_extend('force', opts, {
      cwd = get_git_root(),
    })
  end

  require('telescope.builtin').live_grep(opts)
end

return M
