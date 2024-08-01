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
    {
      '<leader>cdp',
      '<cmd>lua require("refactoring").debug.printf({below = false})<CR>',
      mode = 'n',
      desc = '[D]ebug [P]rint',
    },
    {
      '<leader>cdv',
      '<cmd>lua require("refactoring").debug.print_var()<CR>',
      mode = { 'x', 'n' },
      desc = '[D]ebug print [V]ariable',
    },
    {
      '<leader>cdC',
      '<cmd>lua require("refactoring").debug.cleanup({})<CR>',
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
