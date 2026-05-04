-- Syntax highlighting

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  event = 'VeryLazy',
  build = function()
    require('nvim-treesitter.install').update()
  end,
  dependencies = {
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      opts = {
        custom_calculation = function (node, language_tree)
          if vim.bo.filetype == 'blade' and language_tree._lang ~= 'javascript' then
            return '{{-- %s --}}'
          end
        end,
      },
    },
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
  },
  main = 'nvim-treesitter.config',
  opts = {
    ensure_installed = {
      'arduino',
      'bash',
      'comment',
      'css',
      'diff',
      'dockerfile',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      "go",
      "gomod",
      "gosum",
      "gowork",
      'html',
      'http',
      'ini',
      'javascript',
      'json',
      'jsonc',
      'lua',
      'make',
      'markdown',
      'markdown_inline',
      'passwd',
      'php',
      'phpdoc',
      'python',
      'regex',
      'ruby',
      'rust',
      'sql',
      'svelte',
      'typescript',
      'vim',
      'vue',
      'xml',
      'yaml',
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = { "yaml" }
    },
    rainbow = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['if'] = '@function.inner',
          ['af'] = '@function.outer',
          ['ia'] = '@parameter.inner',
          ['aa'] = '@parameter.outer',
        },
      },
    },
  },
  config = function (_, opts)
    require('nvim-treesitter.config').setup(opts)

    local parser_config = require "nvim-treesitter.parsers"
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = {"src/parser.c"},
        branch = "main",
      },
      filetype = "blade"
    }
    vim.filetype.add({
      pattern = {
        ['.*%.blade%.php'] = 'blade',
      },
    })
  end,
}
