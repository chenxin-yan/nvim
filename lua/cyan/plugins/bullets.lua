return {
  'bullets-vim/bullets.vim',
  ft = { 'markdown', 'text' },
  config = function()
    vim.g.bullets_enabled_file_types = { 'markdown', 'text' }
    vim.g.bullets_set_mappings = 0
    vim.gbullets_outline_levels = { 'num', 'abc', 'std-' }
    vim.g.bullets_custom_mappings = {
      { 'imap', '<cr>', '<Plug>(bullets-newline)' },
      { 'inoremap', '<C-cr>', '<cr>' },
      { 'nmap', 'o', '<Plug>(bullets-newline)' },
      { 'vmap', 'gN', '<Plug>(bullets-renumber)' },
      { 'nmap', 'gN', '<Plug>(bullets-renumber)' },
      { 'nmap', '<C-x>', '<Plug>(bullets-toggle-checkbox)' },
      { 'imap', '<C-t>', '<Plug>(bullets-demote)' },
      { 'imap', '<C-d>', '<Plug>(bullets-promote)' },
    }
  end,
}
