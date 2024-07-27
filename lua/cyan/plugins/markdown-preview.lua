return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  keys = {
    { '<leader>tp', ft = 'markdown', '<cmd>MarkdownPreviewToggle<CR>', desc = '[T]oggle Markdown [P]review' },
  },
}
