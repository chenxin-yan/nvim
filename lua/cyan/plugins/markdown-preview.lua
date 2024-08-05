return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  keys = {
    { '<leader>tp', ft = 'markdown', '<cmd>MarkdownPreviewToggle<cr>', desc = '[T]oggle Markdown [P]review' },
  },
}
