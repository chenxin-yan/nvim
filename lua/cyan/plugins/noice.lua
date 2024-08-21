if vim.g.vscode then
  return {}
end
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  version = '4.4.7',
  keys = {
    -- search notify message
    { '<leader>sm', '<cmd>Telescope notify<cr>', desc = '[M]essages' },
  },
  opts = {
    views = {
      mini = {
        win_options = {
          winblend = 0,
        },
      },
    },
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = true, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },
    routes = {
      {
        filter = {
          event = 'msg_show',
          any = {
            { find = '%d+L, %d+B' },
            { find = '; after #%d+' },
            { find = '; before #%d+' },
            { find = '%d fewer lines' },
            { find = '%d more lines' },
          },
        },
        opts = { skip = true },
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    {
      'rcarriga/nvim-notify',
      keys = {
        {
          '<leader>U',
          function()
            require('notify').dismiss { silent = true, pending = true }
          end,
          desc = 'Dismiss All Notifications',
        },
      },
      opts = {
        background_colour = '#000000',
        stages = 'static',
        timeout = 3000,
        max_height = function()
          return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
          return math.floor(vim.o.columns * 0.75)
        end,
        on_open = function(win)
          vim.api.nvim_win_set_config(win, { zindex = 100 })
        end,
      },
    },
  },
}
