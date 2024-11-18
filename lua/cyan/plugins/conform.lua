return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>F',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = 'n',
      desc = '[F]ormat file',
    },
  },
  opts = function()
    local opts = {
      formatters = {
        ['markdownlint-cli2'] = {
          -- WARN: change to the path to markdownlint config file
          args = { '--fix', '$FILENAME', '--config', vim.fn.expand '~' .. '/.markdownlint.jsonc' },
        },
        sqlfluff = {
          args = { 'format', '--dialect=ansi', '-' },
        },
        biome = {
          require_cwd = true,
        },
      },
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = false, cpp = false }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        html = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier', 'markdownlint-cli2' },
        sql = { 'sqlfluff' },
        mysql = { 'sqlfluff' },
        plsql = { 'sqlfluff' },
      },
    }

    -- setup biome & prettier
    local biome_supported = {
      'css',
      'javascript',
      'javascriptreact',
      'json',
      'jsonc',
      'typescript',
      'typescriptreact',
      'vue',
    }
    for _, ft in ipairs(biome_supported) do
      ---@diagnostic disable-next-line: assign-type-mismatch
      opts.formatters_by_ft[ft] = function(bufnr)
        if require('conform').get_formatter_info('biome', bufnr).available then
          return { 'biome' }
        else
          return { 'prettier' }
        end
      end
    end

    return opts
  end,
}
