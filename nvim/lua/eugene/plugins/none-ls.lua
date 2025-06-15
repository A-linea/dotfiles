-- /Users/eugene/dotfiles/nvim/lua/eugene/plugins/none-ls.lua
return {
  'nvimtools/none-ls.nvim',
  event = 'BufReadPre', -- Або 'BufReadPre', 'BufNewFile' якщо потрібно раніше
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local none_ls = require('none-ls')
    local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

    none_ls.setup({
      sources = {
        none_ls.builtins.diagnostics.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file({ '.eslintrc.js', '.eslintrc.json' })
          end,
        }),
        none_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
        none_ls.builtins.formatting.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file({ '.eslintrc.js', '.eslintrc.json' })
          end,
        }),
        none_ls.builtins.formatting.pint.with({
          condition = function(utils)
            return utils.root_has_file({ 'vendor/bin/pint' })
          end,
        }),
        none_ls.builtins.formatting.prettier.with({
          condition = function(utils)
            return utils.root_has_file({
              '.prettierrc',
              '.prettierrc.json',
              '.prettierrc.yml',
              '.prettierrc.yaml',
              '.prettierrc.js',
              'prettier.config.js',
              '.prettierrc.toml',
            })
          end,
        }),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
            end,
          })
        end
      end,
    })
  end,
}
