return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    input = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    terminal = {
      win = {
        style = 'minimal',
      },
    },
    styles = {
      notification = {
        wo = {
          winblend = 0,
          wrap = true,
        },
      },
    },
  },
  keys = function()
    local Snacks = require 'snacks'
    return {
      {
        '<leader>gB',
        function()
          Snacks.gitbrowse()
        end,
        desc = '[G]it [B]rowse',
      },
      {
        '<leader>gF',
        function()
          Snacks.lazygit.log_file { cwd = Snacks.git.get_root() }
        end,
        desc = 'Lazygit Current [F]ile History',
      },
      {
        '<leader>G',
        function()
          Snacks.lazygit { cwd = Snacks.git.get_root() }
        end,
        desc = 'Lazygit',
      },
      {
        '<leader>gL',
        function()
          Snacks.lazygit.log { cwd = Snacks.git.get_root() }
        end,
        desc = 'Lazygit [L]og',
      },
      {
        '<leader>rN',
        function()
          Snacks.rename.rename_file()
        end,
        desc = '[R]ename File',
      },
      {
        ']]',
        function()
          Snacks.words.jump(vim.v.count1)
        end,
        desc = 'Next Reference',
        mode = { 'n', 't' },
      },
      {
        '[[',
        function()
          Snacks.words.jump(-vim.v.count1)
        end,
        desc = 'Prev Reference',
        mode = { 'n', 't' },
      },
      {
        '<c-\\>',
        function()
          Snacks.terminal.toggle(nil, {
            win = {
              position = 'float',
              border = 'rounded',
              width = 0.6,
              height = 0.6,
            },
          })
        end,
        desc = 'Toggle Terminal',
        mode = { 'n', 't' },
      },
      {
        '<leader>bD',
        function()
          Snacks.bufdelete.other()
        end,
        desc = '[D]elete Other Buffers',
        mode = { 'n' },
      },
    }
  end,
}
