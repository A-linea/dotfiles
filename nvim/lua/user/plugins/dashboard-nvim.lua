
local db = require('dashboard')

--dashboard.setup({
--    theme = 'hyper'
--    config = {
--  })

db.setup({
    theme = 'doom',
    config = {
      header = {
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '                                                                       ',
        '  ██████   █████                   █████   █████  ███                  ',
        ' ░░██████ ░░███                   ░░███   ░░███  ░░░                   ',
        '  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ',
        '  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ',
        '  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ',
        '  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ',
        '  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ',
        ' ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ',
        '                                                                       ',
        '',
        '',
        '',
        '',
        '',
        '',
      },

      center = {
        {
          icon = '   ',
          icon_hl = 'Title',
          desc = 'New File ',
          desc_hl = 'String',
          key_format = ' %s', -- remove default surrounding `[]`
          action = 'enew'
        },
        {
          icon = '   ',
          icon_hl = 'Title',
          desc = 'Find File',
          desc_hl = 'String',
          key = 'f',
          keymap = 'SPC f',
          key_hl = 'Number',
          key_format = ' %s', -- remove default surrounding `[]`
          action = 'Telescope find_files'
        },
        {
          icon = '   ',
          desc = 'Recent files',
          key = 'h',
          keymap = 'SPC h',
          key_format = ' %s', -- remove default surrounding `[]`
          action = 'Telescope oldfiles'
        },
        {
          icon = '󰬞   ',
          desc = 'Find word',
          key = 'g',
          keymap = 'SPC g',
          key_format = ' %s', -- remove default surrounding `[]`
          action = 'Telescope live_grep'
        },
      },

      footer = {}  --your footer
    }
  })

vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#6272a4' })
vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#f8f8f2' })
vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#bd93f9' })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })
