return {
  'HiPhish/rainbow-delimiters.nvim',
  event = 'VimEnter',
  config = function()
    require('rainbow-delimiters.setup').setup {}
  end,
}
