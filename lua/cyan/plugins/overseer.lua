return {
  'stevearc/overseer.nvim',
  cmd = {
    'OverseerOpen',
    'OverseerClose',
    'OverseerToggle',
    'OverseerSaveBundle',
    'OverseerLoadBundle',
    'OverseerDeleteBundle',
    'OverseerRunCmd',
    'OverseerRun',
    'OverseerInfo',
    'OverseerBuild',
    'OverseerQuickAction',
    'OverseerTaskAction',
    'OverseerClearCache',
  },
  opts = {
    dap = false,
    task_list = {
      bindings = {
        ['<C-h>'] = false,
        ['<C-j>'] = false,
        ['<C-k>'] = false,
        ['<C-l>'] = false,
      },
    },
    form = {
      win_opts = {
        winblend = 0,
      },
    },
    confirm = {
      win_opts = {
        winblend = 0,
      },
    },
    task_win = {
      win_opts = {
        winblend = 0,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>jl", "<cmd>OverseerToggle<cr>",      desc = "Task list" },
    { "<leader>jj", "<cmd>OverseerRun<cr>",         desc = "Run task" },
    { "<leader>jq", "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
    { "<leader>ji", "<cmd>OverseerInfo<cr>",        desc = "Overseer Info" },
    { "<leader>jb", "<cmd>OverseerBuild<cr>",       desc = "Task builder" },
    { "<leader>ja", "<cmd>OverseerTaskAction<cr>",  desc = "Task action" },
    { "<leader>jc", "<cmd>OverseerClearCache<cr>",  desc = "Clear cache" },
  },
}
