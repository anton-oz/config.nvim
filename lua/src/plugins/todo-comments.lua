return {
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = true,
      keywords = {
        DOC = {
          icon = '󰷈 ',
          color = '#a6e3a1',
        },
      },
    },
  },
}
