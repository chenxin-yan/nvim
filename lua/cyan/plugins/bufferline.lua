if vim.g.has_bufferline then
  return {
    'akinsho/bufferline.nvim',
    version = '*',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = 'nvim-tree/nvim-web-devicons',
    after = 'catppuccin',
    config = function()
      local bufferline = require 'bufferline'
      bufferline.setup {
        options = {
          diagnostics = 'nvim_lsp',
          show_buffer_close_icons = false,
          always_show_bufferline = false,
          offsets = {
            {
              filetype = 'neo-tree',
              text = 'Workspace',
              text_align = 'center',
            },
            {
              filetype = 'undotree',
              text = 'Undo Tree',
              text_align = 'left',
              separator = true,
            },
          },
        },

        highlights = require('catppuccin.groups.integrations.bufferline').get(),
      }

      -- buffer commands & keymaps
      local function buffer_map(key, cmd, desc)
        vim.keymap.set('n', key, cmd, { desc = 'Bufline: ' .. desc })
      end
      buffer_map(']b', '<cmd>BufferLineCycleNext<cr>', 'Goto next buffer')
      buffer_map('[b', '<cmd>BufferLineCyclePrev<cr>', 'Goto previous buffer')

      buffer_map('<leader>bc', '<cmd>BufferLineGroupClose ungrouped<cr>', '[C]lose unpined buffers ')
      buffer_map('<leader>bD', '<cmd>BufferLineCloseOthers<cr>', '[D]elete other buffers')
      buffer_map('<leader>bp', '<cmd>BufferLineTogglePin<cr>', '[P]in buffer')

      buffer_map('<leader><leader>', '<cmd>BufferLinePick<cr>', 'Buffer Pick')

      buffer_map('<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', 'Goto Buffer 1')
      buffer_map('<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', 'Goto Buffer 2')
      buffer_map('<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', 'Goto Buffer 3')
      buffer_map('<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', 'Goto Buffer 4')
    end,
  }
end
return {}
