return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      require('mini.statusline').setup()

      require('mini.tabline').setup()
      -- Example: Catppuccin-inspired style
      vim.api.nvim_set_hl(
        0,
        'MiniTablineCurrent',
        { fg = '#cdd6f4', bg = '#313244', underline = true, bold = true }
      )
      vim.api.nvim_set_hl(
        0,
        'MiniTablineVisible',
        { fg = '#a6adc8', bg = '#1e1e2e' }
      )
      vim.api.nvim_set_hl(
        0,
        'MiniTablineHidden',
        { fg = '#989bb0', bg = '#1e1e2e' }
      )
      vim.api.nvim_set_hl(
        0,
        'MiniTablineModifiedCurrent',
        { fg = '#f9e2af', bg = '#313244', underline = true, bold = true }
      )
      vim.api.nvim_set_hl(
        0,
        'MiniTablineModifiedVisible',
        { fg = '#f9e2af', bg = '#1e1e2e' }
      )
      vim.api.nvim_set_hl(
        0,
        'MiniTablineModifiedHidden',
        { fg = '#f9e2af', bg = '#1e1e2e' }
      )
      vim.api.nvim_set_hl(0, 'MiniTablineFill', { bg = '#1e1e2e' })
      vim.api.nvim_set_hl(
        0,
        'MiniTablineTabpagesection',
        { fg = '#cba6f7', bg = '#1e1e2e', bold = true }
      )
      -- Simple and easy statusline.
      -- local statusline = require 'mini.statusline'
      -- statusline.setup { use_icons = vim.g.have_nerd_font }
    end,
  },
}
