return {
  {
    'folke/twilight.nvim',
    cmd = { 'Twilight' },
    keys = {
      { '<leader>tt', '<cmd>Twilight<cr>', desc = '[T]oggle [T]wilight' },
    },
    opts = {
      dimming = {
        alpha = 0.45,
      },
    },
  },
  {
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
        twilight = { enabled = false },
        gitsigns = { enabled = true },
      },
      neovide = {
        enabled = vim.g.neovide,
      },
    },
  },
}
