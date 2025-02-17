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
    gitbrowse = {
      what = 'branch',
    },
    styles = {
      notification = {
        wo = {
          winblend = 0,
          wrap = true,
        },
      },
    },
    image = {
      inline = false,
      float = true,
    },
  },
  keys = function()
    local Snacks = require 'snacks'
    Snacks.input.enable()
    return {
      {
        '<leader>gB',
        function()
          Snacks.gitbrowse()
        end,
        desc = '[G]it [B]rowse',
      },
      {
        '<leader>gf',
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
        '<leader>R',
        function()
          Snacks.terminal('posting --collection REST --env rest.env', { cwd = Snacks.git.get_root() })
        end,
        desc = '[R]est Client (Posting)',
      },
      {
        '<leader>gl',
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
              width = 0.65,
              height = 0.8,
            },
          })
        end,
        desc = 'Toggle Terminal',
        mode = { 'n', 't' },
      },
      {
        '<leader>bd',
        function()
          Snacks.bufdelete.delete()
        end,
        desc = '[D]elete Other Buffers',
        mode = { 'n' },
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
