return {
  'bullets-vim/bullets.vim',
  ft = 'markdown',
  config = function()
    vim.g.bullets_enabled_file_types = {
      'markdown',
    }
    -- easier keymaps for indenting
    vim.keymap.set('i', '<tab>', '<C-t>')
    vim.keymap.set('i', '<S-tab>', '<C-d>')
  end,
}
