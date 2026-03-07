return {
  { -- Highlight, edit, and navigate code
    -- See `:help nvim-treesitter`
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    -- Sets main module to use for opts
    -- main = 'src.plugins.treesitter',

    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'typescript',
        'javascript',
        'tsx',
        'css',
        'scss',
        'rust',
        'python',
        'svelte',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      fold = { enable = true },
    },
  },
}
