return {
  'numToStr/Navigator.nvim',
  cmd = {
    'NavigatorLeft',
    'NavigatorDown',
    'NavigatorUp',
    'NavigatorRight',
    'NavigatorPrevious',
  },
  keys = {
    { '<c-h>', '<cmd>NavigatorLeft<cr>' },
    { '<c-j>', '<cmd>NavigatorDown<cr>' },
    { '<c-k>', '<cmd>NavigatorUp<cr>' },
    { '<c-l>', '<cmd>NavigatorRight<cr>' },
    { '<c-\\>', '<cmd>NavigatorPrevious<cr>' },
  },
  opts = {
    auto_save = false,
    disable_on_zoom = true,
  },
}
