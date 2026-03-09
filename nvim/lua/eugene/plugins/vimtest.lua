-- Testing helper

return {
  'vim-test/vim-test',
  keys = {
    { '<Leader>tn', '<Cmd>TestNearest<CR>', desc = 'Test Nearest' },
    { '<Leader>tf', '<Cmd>TestFile<CR>', desc = 'Test File' },
    { '<Leader>ts', '<Cmd>TestSuite<CR>', desc = 'Test Suite' },
    { '<Leader>tl', '<Cmd>TestLast<CR>', desc = 'Test Last' },
    { '<Leader>tv', '<Cmd>TestVisit<CR>', desc = 'Test Visit' },
  },
  dependencies = { 'voldikss/vim-floaterm' },
  config = function()
    vim.cmd([[
      let test#php#phpunit#options = '--colors=always'
      let test#php#pest#options = '--colors=always'

      function! FloatermStrategy(cmd)
        execute 'silent FloatermSend q'
        execute 'silent FloatermKill'
        execute 'FloatermNew! '.a:cmd.' |less -X'
      endfunction

      let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
      let g:test#strategy = 'floaterm'
    ]])
  end
}
