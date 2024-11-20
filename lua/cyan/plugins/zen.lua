return {
  'folke/zen-mode.nvim',
  cmd = { 'ZenMode' },
  keys = {
    { '<leader>tz', '<cmd>ZenMode<cr>', desc = '[T]oggle [Z]en mode' },
  },
  opts = {
    window = {
      options = {
        -- signcolumn = "no", -- disable signcolumn
        number = false, -- disable number column
        relativenumber = false, -- disable relative numbers
        -- cursorline = false, -- disable cursorline
        -- cursorcolumn = false, -- disable cursor column
        -- foldcolumn = "0", -- disable fold column
        -- list = false, -- disable whitespace characters
      },
    },
    plugins = {
      gitsigns = { enabled = true },
    },
  },
}
