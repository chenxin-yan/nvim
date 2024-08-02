return {
  {
    'folke/trouble.nvim',
    opts = {
      modes = { lsp_document_symbols = { format = '{kind_icon} {symbol.name}' } },
    },
    lazy = true,
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Trouble: Workspace Diagnostics',
      },
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Trouble: Buffer Diagnostics',
      },
      {
        '<leader>cl',
        '<cmd>Trouble symbols toggle focus=false win.size=40<cr>',
        desc = 'Trouble: [L]SP Symbols',
      },
      {
        '<leader>cL',
        '<cmd>Trouble lsp toggle focus=false win.position=right win.size=50<cr>',
        desc = 'Trouble: [L]SP Definitions / references / ...',
      },
      {
        '<leader>xl',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Trouble: Location List',
      },
      {
        '<leader>xq',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Trouble: Quickfix List',
      },
      {
        '[q',
        function()
          if require('trouble').is_open() then
            ---@diagnostic disable-next-line: missing-parameter
            require('trouble').prev { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Previous Trouble/Quickfix Item',
      },
      {
        ']q',
        function()
          if require('trouble').is_open() then
            ---@diagnostic disable-next-line: missing-parameter
            require('trouble').next { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Next Trouble/Quickfix Item',
      },
    },
  },
}
