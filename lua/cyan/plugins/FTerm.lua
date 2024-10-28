return {
  'numToStr/FTerm.nvim',
  keys = {
    { '<C-\\>', '<cmd>lua require("FTerm").toggle()<cr>', desc = 'Toggle [T]erminal', mode = { 'n' } },
    { '<C-\\>', '<C-\\><C-n><cmd>lua require("FTerm").toggle()<cr>', desc = 'Toggle [T]erminal', mode = { 't' } },
    { '<C-q>', '<C-\\><C-n><cmd>lua require("FTerm").exit()<cr>', desc = 'Exit [T]erminal', mode = { 't' } },
  },
  config = true,
}
