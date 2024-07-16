if vim.g.has_bufferline then
  return {
    'akinsho/bufferline.nvim',
    version = '*',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local bufferline = require 'bufferline'
      bufferline.setup {
        options = {
          diagnostics = 'nvim_lsp',
          show_buffer_close_icons = false,
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
        vim.keymap.set('n', key, cmd, { desc = 'BufLine: ' .. desc })
      end
      buffer_map(']b', '<cmd>BufferLineCycleNext<CR>', 'Goto next buffer')
      buffer_map('[b', '<cmd>BufferLineCyclePrev<CR>', 'Goto previous buffer')

      buffer_map('<leader>bc', '<cmd>BufferLineGroupClose ungrouped<CR>', '[C]lose unpined buffers ')
      buffer_map('<leader>bC', '<cmd>BufferLineCloseOthers<CR>', '[C]lose other buffers')
      buffer_map('<leader>bp', '<cmd>BufferLineTogglePin<CR>', '[P]in buffer')

      buffer_map('<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', 'Goto Buffer 1')
      buffer_map('<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', 'Goto Buffer 2')
      buffer_map('<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', 'Goto Buffer 3')
      buffer_map('<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', 'Goto Buffer 4')
      buffer_map('<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', 'Goto Buffer 5')
    end,
  }
end
return {}
