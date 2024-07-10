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

    buffer_map('<leader>bc', '<cmd>BufferLineCloseOthers<CR>', '[R]emove other buffers')
  end,
}
