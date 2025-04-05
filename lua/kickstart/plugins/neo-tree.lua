-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<F2>', ':Neotree current<CR>', desc = 'Neotree full view', silent = true },
  },
  lazy = false,
  opts = {
    filesystem = {
      hijack_netrw_behavior = 'open_current',
      filtered_items = {
        visible = true,
        -- hide_dotfiles = false,
        -- hide_gitignored = false,
        -- hide_hidden = false,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<F2>'] = 'close_window',
        },
      },
    },
  },
}
