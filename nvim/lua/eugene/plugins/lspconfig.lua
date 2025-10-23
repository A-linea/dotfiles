--- Language Server Protocol

return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
  },
  config = function()
    -- Mason setup
    require('mason').setup({
      ui = {
        height = 0.8,
      },
    })

    -- Mason-lspconfig setup
    require('mason-lspconfig').setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls", -- Changed from tsserver
        "intelephense",
        "vue_ls", -- Changed from volar
        "tailwindcss",
        "jsonls",
        "gopls",
      },
    })
    
    local capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )

    local function setup_server(name, opts)
      local has_new = vim.lsp and vim.lsp.config and vim.lsp.enable
      if has_new then
        vim.lsp.config(name, opts or {})
        vim.lsp.enable(name)
      else
        require('lspconfig')[name].setup(opts or {})
      end
    end

    -- PHP (Intelephense)
    setup_server('intelephense', {
      commands = {
        IntelephenseIndex = {
          function()
            vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
          end,
        },
      },
      on_attach = function(client, bufnr)
        -- Можна додати свої кастомізації тут
      end,
      capabilities = capabilities,
    })

    -- Vue (vue_ls)
    setup_server('vue_ls', {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      capabilities = capabilities,
    })

    -- TypeScript / JavaScript
    setup_server('ts_ls', { -- Changed from tsserver
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
            languages = { "javascript", "typescript", "vue" },
          },
        },
      },
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
      },
      capabilities = capabilities,
    })

    -- Tailwind CSS
    setup_server('tailwindcss', {
      capabilities = capabilities,
    })

    -- JSON
    setup_server('jsonls', {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        },
      },
    })

    -- Lua
    setup_server('lua_ls', {
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          workspace = {
            checkThirdParty = false,
            library = {
              '${3rd}/luv/library',
              unpack(vim.api.nvim_get_runtime_file('', true)),
            },
          },
        },
      },
    })

    -- Go
    setup_server('gopls', {
      capabilities = capabilities,
    })

    -- Keymaps
    vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
    vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>')
    vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
    vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
    vim.keymap.set('n', '<Leader>lr', ':LspRestart<CR>', { silent = true })
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

    -- Diagnostics config
    vim.diagnostic.config({
      virtual_text = false,
      float = {
        source = true,
      },
    })

    -- Signs
    vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
  end,
}

