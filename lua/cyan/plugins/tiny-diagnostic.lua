return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'LspAttach',
  priority = 1000, -- needs to be loaded in first
  config = function()
    require('tiny-inline-diagnostic').setup {
      options = {
        format = function(diagnostic)
          return diagnostic.message .. ' [' .. diagnostic.source .. ']'
        end,
      },
    }
    vim.diagnostic.config { virtual_text = false }
  end,
}
