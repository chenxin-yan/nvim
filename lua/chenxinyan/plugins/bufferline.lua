return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    require('bufferline').setup {
      options = {
        show_close_icon = false,
        offsets = { {
          filetype = 'neo-tree',
          text = 'Workspace',
          text_align = 'center',
        } },
      },
    }

    -- buffer commands & keymaps
    local function buffer_map(key, cmd, desc)
      vim.keymap.set('n', key, cmd, { desc = '[B]uffer: ' .. desc })
    end
    buffer_map(']b', ':BufferLineCycleNext<CR>', 'Goto next buffer')
    buffer_map('[b', ':BufferLineCyclePrev<CR>', 'Goto previous buffer')
    buffer_map(']B', ':BufferLineCloseRight<CR>', 'Close next buffer')
    buffer_map('[B', ':BufferLineCloseLeft<CR>', 'Close previous buffer')
    -- buffer_map('<leader>bh', ':BufferLineMovePrevious<CR>', 'Move buffer to left')
    -- buffer_map('<leader>bl', ':BufferLineMoveNext<CR>', 'Move buffer to right')

    buffer_map('<leader>bc', ':BufferLineCloseOthers<CR>', 'Close other buffers')

    -- buffer_map('<leader>bp', ':BufferLineTogglePin<CR>', '[P]in buffer')

    -- buffer_map('<leader>b1', ':BufferLineGoToBuffer 1<CR>', 'Goto Buffer 1')
    -- buffer_map('<leader>b2', ':BufferLineGoToBuffer 2<CR>', 'Goto Buffer 2')
    -- buffer_map('<leader>b3', ':BufferLineGoToBuffer 3<CR>', 'Goto Buffer 3')
    -- buffer_map('<leader>b4', ':BufferLineGoToBuffer 4<CR>', 'Goto Buffer 4')
  end,
}
