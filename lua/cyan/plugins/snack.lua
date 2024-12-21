return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    notifier = {
      enabled = true,
      timeout = 3000,
    },
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
        '<leader>sm',
        function()
          Snacks.notifier.show_history()
        end,
        desc = 'Notification History [M]essages',
      },
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
          Snacks.lazygit.log_file()
        end,
        desc = 'Lazygit Current [F]ile History',
      },
      {
        '<leader>G',
        function()
          Snacks.lazygit()
        end,
        desc = 'Lazygit',
      },
      {
        '<leader>gl',
        function()
          Snacks.lazygit.log()
        end,
        desc = 'Lazygit [L]og (cwd)',
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
          Snacks.terminal.toggle()
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
