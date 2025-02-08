return {
  'stevearc/overseer.nvim',
  event = 'VeryLazy',
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
      direction = 'left',
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
    { "<leader>jt", "<cmd>OverseerRun<cr>",         desc = "Run task" },
    { "<leader>jA", "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
    { "<leader>ji", "<cmd>OverseerInfo<cr>",        desc = "Overseer Info" },
    { "<leader>jB", "<cmd>OverseerBuild<cr>",       desc = "Task builder" },
    { "<leader>ja", "<cmd>OverseerTaskAction<cr>",  desc = "Task action" },
    { "<leader>jc", "<cmd>OverseerClearCache<cr>",  desc = "Clear cache" },
    { "<leader>jb", "",  desc = "Bundle" },
    { "<leader>jbs", "<cmd>OverseerSaveBundle<cr>",  desc = "Save Bundle" },
    { "<leader>jbl", "<cmd>OverseerLoadBundle<cr>",  desc = "Load Bundle" },
    { "<leader>jbd", "<cmd>OverseerDeleteBundle<cr>",  desc = "Delete Bundle" },
  },
}
