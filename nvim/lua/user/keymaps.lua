vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", {expr = true})
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", {expr = true})

-- Maintain the cursor position when yanking a visual selection
vim.keymap.set('v', 'y', 'myy`y')
-- disable Command line type
vim.keymap.set('n', 'q:', ':q');

-- Paste replace visual selection without copying it
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A,')

-- Quickly clear search highlighting.
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- Move lines up and down for MacOS
vim.keymap.set('i', '∆', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '˚', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '∆', ':move .+1<CR>==gi')
vim.keymap.set('n', '˚', ':move .-2<CR>==gi')
vim.keymap.set('v', '∆', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '˚', ":move '<-2<CR>gv=gv")
