return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  event = 'VeryLazy',
  version = '*',
  keys = {
    {
      '<leader>ub',
      '<cmd>lua require("barbecue.ui").toggle()<CR>',
      mode = 'n',
      desc = 'Toggle [B]arbecue',
    },
  },
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons', -- optional dependency
  },
  config = function()
    require('barbecue').setup {
      create_autocmd = false, -- prevent barbecue from updating itself automatically
      show_dirname = false,
      show_modified = true,
      theme = 'catppuccin-mocha',
    }
    vim.api.nvim_create_autocmd({
      'WinScrolled', -- or WinResized on NVIM-v0.9 and higher
      'BufWinEnter',
      'CursorHold',
      'InsertLeave',
      -- include this if you have set `show_modified` to `true`
      'BufModifiedSet',
    }, {
      group = vim.api.nvim_create_augroup('barbecue.updater', {}),
      callback = function()
        require('barbecue.ui').update()
      end,
    })
  end,
}
