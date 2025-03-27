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
    opts = {
      enable_close = true,
      enable_rename = true,
      auto_close_on_slash = false,
    },
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
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
}
