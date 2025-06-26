return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  cmd = { 'FzfLua', 'TodoFzflua' },
  opts = function()
    local fzf = require 'fzf-lua'
    local config = fzf.config
    local actions = fzf.actions

    fzf.register_ui_select()

    config.defaults.keymap.fzf['ctrl-q'] = 'select-all+accept'
    config.defaults.keymap.fzf['ctrl-u'] = 'half-page-up'
    config.defaults.keymap.fzf['ctrl-d'] = 'half-page-down'
    config.defaults.keymap.fzf['ctrl-x'] = 'jump'
    config.defaults.keymap.fzf['ctrl-f'] = 'preview-page-down'
    config.defaults.keymap.fzf['ctrl-b'] = 'preview-page-up'
    config.defaults.keymap.builtin['<c-f>'] = 'preview-page-down'
    config.defaults.keymap.builtin['<c-b>'] = 'preview-page-up'

    config.defaults.actions.files['ctrl-t'] = require('trouble.sources.fzf').actions.open

    return {
      { 'ivy' },
      fzf_colors = true,
      fzf_opts = {
        ['--no-scrollbar'] = true,
      },
      defaults = {
        formatter = 'path.dirname_first',
      },
      winopts = {
        height = 0.5,
        preview = {
          scrollchars = { '┃', '' },
        },
      },
      files = {
        cwd_prompt = false,
        hidden = false,
        actions = {
          ['ctrl-i'] = { actions.toggle_ignore },
          ['ctrl-h'] = { actions.toggle_hidden },
        },
      },
      grep = {
        actions = {
          ['ctrl-i'] = { actions.toggle_ignore },
          ['ctrl-h'] = { actions.toggle_hidden },
        },
      },
    }
  end,
  keys = {
    -- files
    {
      '<leader>sf',
      '<cmd>FzfLua files<cr>',
      desc = '[F]iles',
    },
    {
      '<leader><leader>',
      '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>',
      desc = 'Open Buffers',
    },
    {
      '<leader>.',
      '<cmd>FzfLua oldfiles<cr>',
      desc = 'Recent Files',
    },
    {
      '<leader>/',
      '<cmd>FzfLua blines<cr>',
      desc = '[/] Fuzzily search in current buffer',
    },
    {
      '<leader>s/',
      '<cmd>FzfLua lines<cr>',
      desc = '[/] Fuzzily search in open buffers',
    },

    -- diagnostics
    { '<leader>sd', '<cmd>FzfLua diagnostics_document<cr>', desc = 'Document Diagnostics' },
    { '<leader>sD', '<cmd>FzfLua diagnostics_workspace<cr>', desc = 'Workspace Diagnostics' },

    -- grep
    {
      '<leader>sg',
      '<cmd>FzfLua live_grep<cr>',
      desc = '[G]rep project',
    },
    {
      '<leader>s*',
      '<cmd>FzfLua grep_cword<cr>',
      desc = 'Current [W]ord',
    },
    {
      '<leader>s*',
      '<cmd>FzfLua grep_visual<cr>',
      mode = 'v',
      desc = 'Current [W]ord',
    },

    -- git
    { '<leader>gl', '<cmd>FzfLua git_commits<CR>', desc = 'Commits' },
    { '<leader>gs', '<cmd>FzfLua git_status<CR>', desc = 'Status' },
    { '<leader>gb', '<cmd>FzfLua git_branches<CR>', desc = 'Branches' },
    { '<leader>gf', '<cmd>FzfLua git_bcommits<CR>', desc = 'File' },

    -- lsp
    {
      '<leader>ss',
      function()
        require('fzf-lua').lsp_document_symbols {}
      end,
      desc = 'Goto Symbol',
    },
    {
      '<leader>sS',
      function()
        require('fzf-lua').lsp_live_workspace_symbols {}
      end,
      desc = 'Goto Symbol (Workspace)',
    },

    -- misc
    { '<leader>sh', '<cmd>FzfLua help_tags<cr>', desc = 'Help Pages' },
    { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = 'Key Maps' },
    { 'Z', '<cmd>lua require"fzf-lua".spell_suggest({ winopts = { relative="cursor", row=1.01, col=0, height=0.2, width=0.2 } })<cr>' },
  },
}
