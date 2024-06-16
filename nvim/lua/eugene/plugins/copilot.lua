-- GitHub Copilot

return {
  'github/copilot.vim',
  config = function()
    vim.cmd([[
      imap <silent><script><expr> <C-h> copilot#Accept("\<CR>")
      let g:copilot_no_tab_map = v:true
    ]])
  end,
}
