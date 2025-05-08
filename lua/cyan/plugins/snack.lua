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
      doc = {
        inline = false,
        float = true,
      },
    },
    dashboard = {
      enabled = true,
      preset = {
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = ' ', key = 'e', desc = 'New File', action = ':ene | startinsert' },
          { icon = '󰈞 ', key = 'f', desc = 'Find file', action = '<CMD>Telescope find_files<CR>' },
          { icon = '󰺮 ', key = 'g', desc = 'Grep text', action = '<CMD>Telescope live_grep<CR>' },
          { icon = '󱊒 ', key = 's', desc = 'Search Session', action = '<cmd>SessionSearch<cr>' },
          { icon = '󰚰 ', key = 'r', desc = 'Restore Session', action = '<cmd>SessionRestore<cr>' },
          { icon = ' ', key = 'l', desc = 'Restore Last Session', action = '<cmd>SessionLoadLast<cr>' },
          { icon = '󰒲 ', key = 'u', desc = 'Update plugins', action = '<cmd>Lazy update<cr>' },
          { icon = ' ', key = 'q', desc = 'Quit NVIM', action = '<cmd>qa<cr>' },
        },
        -- Used by the `header` section
      },
      sections = {
        { section = 'header', padding = 2 },
        { section = 'keys', gap = 1, padding = 2 },
        {
          pane = 2,
          height = 6,
          padding = 6,
        },
        {
          pane = 2,
          icon = ' ',
          desc = 'Browse Repo',
          padding = 1,
          key = 'B',
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = 'Notifications',
              cmd = 'gh notify -s -a -n5',
              action = function()
                vim.ui.open 'https://github.com/notifications'
              end,
              key = 'n',
              icon = ' ',
              height = 5,
              enabled = true,
            },
            {
              title = 'Open Issues',
              cmd = 'gh issue list -L 3',
              key = 'i',
              action = function()
                vim.fn.jobstart('gh issue list --web', { detach = true })
              end,
              icon = ' ',
              height = 6,
            },
            {
              icon = ' ',
              title = 'Open PRs',
              cmd = 'gh pr list -L 3',
              key = 'P',
              action = function()
                vim.fn.jobstart('gh pr list --web', { detach = true })
              end,
              height = 6,
            },
            {
              icon = ' ',
              title = 'Git Status',
              cmd = 'git --no-pager diff --stat -B -M -C',
              height = 8,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend('force', {
              pane = 2,
              section = 'terminal',
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { section = 'startup', padding = 2 },
      },
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
