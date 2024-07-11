return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        '<C-S-N>',
        function()
          require('harpoon'):list():next()
        end,
      },
      {
        '<C-S-P>',
        function()
          require('harpoon'):list():prev()
        end,
      },
      {
        '<leader>4',
        function()
          require('harpoon'):list():select(4)
        end,
        desc = 'Goto Harpoon 4',
      },
      {
        '<leader>3',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'Goto Harpoon 3',
      },
      {
        '<leader>2',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'Goto Harpoon 2',
      },
      {
        '<leader>1',
        function()
          require('harpoon'):list():select(1)
        end,
        desc = 'Goto Harpoon 1',
      },
      {
        '<leader>th',
        function()
          require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
        end,
        desc = '[T]oggle [H]arpoon Menu',
      },
      {
        '<leader>da',
        function()
          require('harpoon'):list():add()
        end,
        desc = '[D]ocument [A]dd to harpoon',
      },
    },
    config = function()
      require('harpoon'):setup {
        settings = {
          save_on_toggle = true,
        },
      }
    end,
  },
}
