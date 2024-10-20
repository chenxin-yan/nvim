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
        offsets = {
          {
            filetype = 'trouble',
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
    buffer_map('<c-]>', '<cmd>BufferLineCycleNext<cr>', 'Goto next buffer')
    buffer_map('<c-[>', '<cmd>BufferLineCyclePrev<cr>', 'Goto previous buffer')

    buffer_map('<leader>S', '<cmd>BufferLinePick<cr>', 'Buffer [P]ick')
  end,
}
