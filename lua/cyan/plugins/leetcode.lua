return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html',
  dependencies = {
    'ibhagwan/fzf-lua',
    'nvim-lua/plenary.nvim', -- required by telescope
    'MunifTanjim/nui.nvim',

    -- optional
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  lazy = 'Leetcode.nvim' ~= vim.fn.argv()[1],
  opts = { arg = 'Leetcode.nvim', lang = 'java' },
}
