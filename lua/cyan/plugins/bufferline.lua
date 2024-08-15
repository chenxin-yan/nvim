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
    buffer_map(']B', '<cmd>BufferLineMoveNext<cr>', 'Goto next buffer')
    buffer_map('[B', '<cmd>BufferLineMovePrev<cr>', 'Goto previous buffer')

    buffer_map('<leader>bD', '<cmd>BufferLineGroupClose ungrouped<cr>', '[D]elete Unpined buffers ')
    buffer_map('<leader>bo', '<cmd>BufferLineCloseOthers<cr>', 'Delete [O]ther buffers')
    buffer_map('<leader>bp', '<cmd>BufferLineTogglePin<cr>', '[P]in buffer')

    buffer_map('<leader><leader>', '<cmd>BufferLinePick<cr>', 'Buffer Pick')

    buffer_map('<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', 'Goto [B]uffer 1')
    buffer_map('<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', 'Goto [B]uffer 2')
    buffer_map('<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', 'Goto [B]uffer 3')
    buffer_map('<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', 'Goto [B]uffer 4')
    buffer_map('<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>', 'Goto [B]uffer 5')
  end,
}
