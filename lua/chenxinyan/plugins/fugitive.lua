return {
  'tpope/vim-fugitive',
  event = 'VimEnter',
  config = function()
    -- Git commands
    vim.keymap.set('n', '<leader>ga', ':Git add *', { desc = '[G]it [A]dd' })
    vim.keymap.set('n', '<leader>gc', ':Git commit -m "', { desc = '[G]it commit' })
    vim.keymap.set('n', '<leader>gA', ':Git commit --amend --no-edit', { desc = '[G]it [A]mend' })
    vim.keymap.set('n', '<leader>gp', ':Git push', { desc = '[G]it [P]ush' })
  end,
}
