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
    buffer_map('<leader>bp', '<Cmd>BufferLineTogglePin<CR>', 'Toggle Pin')
    buffer_map('<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', 'Delete Non-Pinned Buffers')
    buffer_map('<leader>;', '<Cmd>BufferLinePick<CR>', 'Pick Buffer')

    for i = 1, 5 do
      buffer_map('<leader>' .. i, '<cmd>BufferLineGoToBuffer ' .. i .. '<cr>', 'Goto Buffer ' .. i)
    end
  end,
}
