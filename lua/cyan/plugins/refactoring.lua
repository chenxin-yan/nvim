return {
  'ThePrimeagen/refactoring.nvim',
  keys = {
    {
      '<leader>rf',
      "<cmd>lua require('refactoring').refactor('Extract Function')<CR>",
      desc = '[E]xtract [F]unction',
      mode = 'x',
    },
    {
      '<leader>rF',
      '<cmd>lua require("refactoring").refactor("Extract Function To File")<CR>',
      mode = 'x',
      desc = 'Extract [F]unction to file',
    },
    {
      '<leader>rv',
      '<cmd>lua require("refactoring").refactor("Extract Variable")<CR>',
      mode = 'x',
      desc = 'Extract [V]ariable',
    },
    {
      '<leader>rI',
      '<cmd>lua require("refactoring").refactor("Inline Function")<CR>',
      mode = 'n',
      desc = '[I]nline function',
    },
    {
      '<leader>ri',
      '<cmd>lua require("refactoring").refactor("Inline Variable")<CR>',
      mode = { 'n', 'x' },
      desc = '[I]nline variable',
    },
    {
      '<leader>rb',
      '<cmd>lua require("refactoring").refactor("Extract Block")<CR>',
      mode = 'n',
      desc = 'Extract [B]lock',
    },
    {
      '<leader>rB',
      '<cmd>lua require("refactoring").refactor("Extract Block To File")<CR>',
      mode = 'n',
      desc = 'Extract [B]lock to file',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
