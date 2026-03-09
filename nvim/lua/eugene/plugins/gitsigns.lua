-- Git integration

return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  keys = {
    { ']h', '<Cmd>Gitsigns next_hunk<CR>', desc = 'Next hunk' },
    { '[h', '<Cmd>Gitsigns prev_hunk<CR>', desc = 'Prev hunk' },
    { 'gs', '<Cmd>Gitsigns stage_hunk<CR>', desc = 'Stage hunk' },
    { 'gS', '<Cmd>Gitsigns undo_stage_hunk<CR>', desc = 'Undo stage hunk' },
    { 'gp', '<Cmd>Gitsigns preview_hunk<CR>', desc = 'Preview hunk' },
    { 'gb', '<Cmd>Gitsigns blame_line<CR>', desc = 'Blame line' },
  },
  opts = {
    preview_config = {
      border = { '', '', '', ' ' },
    },
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },
    signs = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '┄' },
      untracked    = { text = '┊' },
    },
  },
}
