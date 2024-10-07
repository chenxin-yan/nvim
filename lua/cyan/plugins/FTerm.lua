return {
  'numToStr/FTerm.nvim',
  keys = {
    { '<M-t>', '<cmd>lua require("FTerm").toggle()<cr>', desc = 'Toggle [T]erminal', mode = { 'n' } },
    { '<M-t>', '<C-\\><C-n><cmd>lua require("FTerm").toggle()<cr>', desc = 'Toggle [T]erminal', mode = { 't' } },
    { '<M-q>', '<C-\\><C-n><cmd>lua require("FTerm").exit()<cr>', desc = 'Exit [T]erminal', mode = { 't' } },
  },
  config = true,
}
