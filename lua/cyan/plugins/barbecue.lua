return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  event = 'VeryLazy',
  version = '*',
  dependencies = {
    {
      'SmiteshP/nvim-navic',
      lazy = true,
      init = function()
        vim.g.navic_silence = true
      end,
      opts = function()
        return {
          highlight = true,
          depth_limit = 5,
          lazy_update_context = true,
        }
      end,
    },
    'nvim-tree/nvim-web-devicons', -- optional dependency
  },
  config = function()
    require('barbecue').setup {
      create_autocmd = false, -- prevent barbecue from updating itself automatically
      attach_navic = true,
      show_dirname = false,
      show_basename = false,
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
