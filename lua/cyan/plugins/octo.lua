return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ibhagwan/fzf-lua',
    'nvim-tree/nvim-web-devicons',
  },
  cmd = 'Octo',
  event = { { event = 'BufReadCmd', pattern = 'octo://*' } },
  opts = {
    enable_builtin = true,
    default_to_projects_v2 = true,
    default_merge_method = 'squash',
    picker = 'fzf-lua',
  },
  keys = {
    { '<leader>gi', '<cmd>Octo issue list<CR>', desc = 'List Issues (Octo)' },
    { '<leader>gI', '<cmd>Octo issue search<CR>', desc = 'Search Issues (Octo)' },
    { '<leader>gp', '<cmd>Octo pr list<CR>', desc = 'List PRs (Octo)' },
    { '<leader>gP', '<cmd>Octo pr search<CR>', desc = 'Search PRs (Octo)' },
    { '<leader>gr', '<cmd>Octo repo list<CR>', desc = 'List Repos (Octo)' },
    -- { '<leader>gS', '<cmd>Octo search<CR>', desc = 'Search (Octo)' },
    { '<leader>go', '<cmd>Octo pr create<CR>', desc = 'Open a PR (Octo)' },
    { '<leader>gO', '<cmd>Octo issue create<CR>', desc = 'Open a Issue (Octo)' },

    { '<localleader>a', '', desc = '+assignee (Octo)', ft = 'octo' },
    { '<localleader>c', '', desc = '+comment/code (Octo)', ft = 'octo' },
    { '<localleader>l', '', desc = '+label (Octo)', ft = 'octo' },
    { '<localleader>i', '', desc = '+issue (Octo)', ft = 'octo' },
    { '<localleader>r', '', desc = '+react (Octo)', ft = 'octo' },
    { '<localleader>p', '', desc = '+pr (Octo)', ft = 'octo' },
    { '<localleader>pr', '', desc = '+rebase (Octo)', ft = 'octo' },
    { '<localleader>ps', '', desc = '+squash (Octo)', ft = 'octo' },
    { '<localleader>v', '', desc = '+review (Octo)', ft = 'octo' },
    { '<localleader>g', '', desc = '+goto_issue (Octo)', ft = 'octo' },
    -- { '@', '@<C-x><C-o>', mode = 'i', ft = 'octo', silent = true },
    -- { '#', '#<C-x><C-o>', mode = 'i', ft = 'octo', silent = true },
  },
}
