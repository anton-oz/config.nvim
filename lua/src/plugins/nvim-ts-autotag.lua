return {
  {
    'windwp/nvim-ts-autotag',
    name = 'nvim-ts-autotag',
    build = ':UpdateRemotePlugins',
    config = function()
      local ts_autotag = require 'nvim-ts-autotag'
      ts_autotag.setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          update_on_insert = true,
          auto_close_on_slash = true,
        },
      }
    end,
  },
}
