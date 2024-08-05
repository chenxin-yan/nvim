return {
  'ThePrimeagen/refactoring.nvim',
  keys = {
    {
      '<leader>rf',
      "<cmd>lua require('refactoring').refactor('Extract Function')<cr>",
      desc = '[E]xtract [F]unction',
      mode = 'x',
    },
    {
      '<leader>rF',
      '<cmd>lua require("refactoring").refactor("Extract Function To File")<cr>',
      mode = 'x',
      desc = 'Extract [F]unction to file',
    },
    {
      '<leader>rv',
      '<cmd>lua require("refactoring").refactor("Extract Variable")<cr>',
      mode = 'x',
      desc = 'Extract [V]ariable',
    },
    {
      '<leader>rI',
      '<cmd>lua require("refactoring").refactor("Inline Function")<cr>',
      mode = 'n',
      desc = '[I]nline function',
    },
    {
      '<leader>ri',
      '<cmd>lua require("refactoring").refactor("Inline Variable")<cr>',
      mode = { 'n', 'x' },
      desc = '[I]nline variable',
    },
    {
      '<leader>rb',
      '<cmd>lua require("refactoring").refactor("Extract Block")<cr>',
      mode = 'n',
      desc = 'Extract [B]lock',
    },
    {
      '<leader>rB',
      '<cmd>lua require("refactoring").refactor("Extract Block To File")<cr>',
      mode = 'n',
      desc = 'Extract [B]lock to file',
    },
    {
      '<leader>cdp',
      '<cmd>lua require("refactoring").debug.printf({below = false})<cr>',
      mode = 'n',
      desc = '[D]ebug [P]rint',
    },
    {
      '<leader>cdv',
      '<cmd>lua require("refactoring").debug.print_var()<cr>',
      mode = { 'x', 'n' },
      desc = '[D]ebug print [V]ariable',
    },
    {
      '<leader>cdC',
      '<cmd>lua require("refactoring").debug.cleanup({})<cr>',
      mode = 'n',
      desc = '[D]ebug print [C]leanup',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    -- prompt for return type
    prompt_func_return_type = {
      go = true,
      cpp = true,
      c = true,
      java = true,
    },
    -- prompt for function parameters
    prompt_func_param_type = {
      go = true,
      cpp = true,
      c = true,
      java = true,
    },
  },
}
