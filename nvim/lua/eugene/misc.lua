vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Disable spellcheck in terminal",
  group = vim.api.nvim_create_augroup("FileTypeOverrides", { clear = true }),
  pattern = "*",
  callback = function()
    vim.opt_local.spell = false
  end,
})

vim.api.nvim_create_autocmd('textyankpost', {
  desc = 'highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
