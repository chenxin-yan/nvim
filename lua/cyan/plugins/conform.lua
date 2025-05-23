return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>bf',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = 'n',
      desc = '[F]ormat buffer',
    },
  },
  opts = function()
    local opts = {
      formatters = {
        ['markdownlint-cli2'] = {
          -- WARN: change to the path to markdownlint config file
          args = { '--fix', '$FILENAME', '--config', vim.fn.expand '~/.markdownlint.jsonc' },
        },
        biome = {
          require_cwd = true,
        },
      },
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat then
          return
        end

        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = {}
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
        html = { 'prettierd' },
        yaml = { 'prettierd' },
        markdown = { 'prettierd', 'markdownlint-cli2' },
        go = { 'goimports', 'golines', 'gofumpt' },
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
          return { 'prettierd' }
        end
      end
    end

    return opts
  end,
}
