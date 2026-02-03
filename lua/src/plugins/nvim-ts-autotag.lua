return {
  {
    'windwp/nvim-ts-autotag',
    name = 'nvim-ts-autotag',
    build = ':UpdateRemotePlugins',
    opts = function()
      ---@diagnostic disable-next-line: missing-fields
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
}
