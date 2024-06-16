vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.title = true
vim.opt.mouse = 'a' -- enable mouse for all modes
vim.opt.mousemoveevent = true -- enable mouse on buffer
vim.opt.termguicolors = true
vim.opt.spell = true
vim.opt.wildmode = 'longest:full,full' -- complete the longest common match, and allow tabbing the results to fully complete them

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.fillchars:append({ eob = ' '})
vim.opt.list = true -- enable the below listchars
vim.opt.listchars = { tab = '▸ ', trail = '·', nbsp = '␣' }
vim.opt.breakindent = true -- maintain indent when wrapping indented lines
vim.opt.linebreak = true -- wrap at word boundaries

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.clipboard = 'unnamedplus'
vim.opt.confirm = true

vim.opt.undofile = true
vim.opt.backup = true
vim.opt.backupdir:remove('.')

