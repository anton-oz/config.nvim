-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
      'neovim/nvim-lspconfig', -- optional
    },
    opts = {}, -- your configuration
  },
  {
    'windwp/nvim-ts-autotag',
    name = 'nvim-ts-autotag',
    build = ':UpdateRemotePlugins',
    opts = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          auto_close_on_slash = true,
        },
      }
    end,
    lazy = false,
  },
  {
    'Mofiqul/vscode.nvim',
    name = 'vscode.vim',
    build = ':UpdateRemotePlugins',
    opts = {
      style = 'dark',
      italic_comments = false,
      underline_links = true,
    },
  },
}
