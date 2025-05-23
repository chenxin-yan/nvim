return {
  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
      {
        '<leader>bl',
        function()
          require('lint').try_lint()
        end,
        desc = '[L]int buffer',
      },
    },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint-cli2' },
        dockerfile = { 'hadolint' },
      }

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })

      -- == config markdownlint ==
      -- WARN: change to the path to markdownlint config file
      local markdownlintrc = vim.fn.expand '~' .. '/.markdownlint.jsonc'
      local markdownlint = require('lint').linters['markdownlint-cli2']
      markdownlint.args = {
        '--config',
        markdownlintrc,
      }
    end,
  },
}
