return {
  'numToStr/FTerm.nvim',
  keys = {
    { '<C-t>', '<cmd>lua require("FTerm").toggle()<cr>', desc = 'Toggle Terminal', mode = { 'n' } },
    { '<C-t><C-t>', '<C-\\><C-n><cmd>lua require("FTerm").toggle()<cr>', desc = 'Toggle Terminal', mode = { 't' } },
  },
  config = true,
}
