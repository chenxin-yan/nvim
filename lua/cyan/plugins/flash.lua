return {
  'folke/flash.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  lazy = true,
  ---@type Flash.Config
  opts = {
    modes = {
      search = {
        enabled = false,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}
