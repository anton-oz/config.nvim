-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)

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
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      require('lualine').setup {
        options = { theme = 'ayu_mirage' },
      }
    end,
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  -- stylua: ignore start
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      styles = {
        comments = {},
      },
    }
  },
  -- stylua: ignore end
  {
    'goolord/alpha-nvim',
    config = function()
      require('alpha').setup(require('alpha.themes.dashboard').config)
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'
      local section = dashboard.section
      -- stylua: ignore start
      local logo = {
        '', '', '', '',
        [[███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄]],
        [[███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄]],
        [[███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███]],
        [[███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███]],
        [[███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███]],
        [[███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███]],
        [[███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███]],
        [[ ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀ ]],
        '',
      }
      -- stylua: ignore end
      ---@diagnostic disable-next-line
      local footer = {
        '',
        [[$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'               `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$]],
        [[$$$$$$$$$$$$$$$$$$$$$$$$$$$$'                   `$$$$$$$$$$$$$$$$$$$$$$$$$$$$]],
        [[$$$'`$$$$$$$$$$$$$'`$$$$$$!                       !$$$$$$'`$$$$$$$$$$$$$'`$$$]],
        [[$$$$  $$$$$$$$$$$  $$$$$$$                         $$$$$$$  $$$$$$$$$$$  $$$$]],
        [[$$$$. `$' \' \$`  $$$$$$$!                         !$$$$$$$  '$/ `/ `$' .$$$$]],
        [[$$$$$. !\  i  i .$$$$$$$$                           $$$$$$$$. i  i  /! .$$$$$]],
        [[$$$$$$   `--`--.$$$$$$$$$                           $$$$$$$$$.--'--'   $$$$$$]],
        [[$$$$$$L        `$$$$$^^$$                           $$^^$$$$$'        J$$$$$$]],
        [[$$$$$$$.   .'   ""~   $$$    $.                 .$  $$$   ~""   `.   .$$$$$$$]],
        [[$$$$$$$$.  ;      .e$$$$$!    $$.             .$$  !$$$$$e,      ;  .$$$$$$$$]],
        [[$$$$$$$$$   `.$$$$$$$$$$$$     $$$.         .$$$   $$$$$$$$$$$$.'   $$$$$$$$$]],
        [[$$$$$$$$    .$$$$$$$$$$$$$!     $$`$$$$$$$$'$$    !$$$$$$$$$$$$$.    $$$$$$$$]],
        [[$$$$$$$     $$$$$$$$$$$$$$$$.    $    $$    $   .$$$$$$$$$$$$$$$$     $$$$$$$]],
        [[                                 $    $$    $                                ]],
        [[                                 $.   $$   .$                                ]],
        [[                                 `$        $'                                ]],
        [[                                  `$$$$$$$$'                                 ]],
      }
      section.header.val = logo

      section.buttons.val = {
        dashboard.button('r', '  > Recent Files', ':Telescope oldfiles <CR>'),
        dashboard.button('f', '󰈞  > Find File', ':cd $HOME | Telescope find_files <CR>'),
        dashboard.button('e', '  > New File', ':ene <CR>'),
        dashboard.button('o', '󰈮 > Open Coder', ':cd $HOME/coder | Telescope find_files <CR>'),
        dashboard.button('c', '  > Edit NeoVim Config', ':cd $nvim | Neotree current <CR>'),
        dashboard.button('q', '  > Quit NeoVim', ':q!<CR>'),
      }

      section.footer.val = {
        '',
        "If two wrongs don't make a right, try three.",
      }
      -- section.footer.val = footer

      -- NOTE: color opts
      -- 'String' | 'Identifier' | 'Keyword' | 'Number'
      section.header.opts.hl = 'Keyword'
      section.footer.opts.hl = 'Identifier'

      alpha.setup(dashboard.config)
    end,
  },
}
--[[
"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'               `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",
"$$$$$$$$$$$$$$$$$$$$$$$$$$$$'                   `$$$$$$$$$$$$$$$$$$$$$$$$$$$$",
"$$$'`$$$$$$$$$$$$$'`$$$$$$!                       !$$$$$$'`$$$$$$$$$$$$$'`$$$",
"$$$$  $$$$$$$$$$$  $$$$$$$                         $$$$$$$  $$$$$$$$$$$  $$$$",
"$$$$. `$' \' \$`  $$$$$$$!                         !$$$$$$$  '$/ `/ `$' .$$$$",
"$$$$$. !\  i  i .$$$$$$$$                           $$$$$$$$. i  i  /! .$$$$$",
"$$$$$$   `--`--.$$$$$$$$$                           $$$$$$$$$.--'--'   $$$$$$",
"$$$$$$L        `$$$$$^^$$                           $$^^$$$$$'        J$$$$$$",
"$$$$$$$.   .'   ""~   $$$    $.                 .$  $$$   ~""   `.   .$$$$$$$",
"$$$$$$$$.  ;      .e$$$$$!    $$.             .$$  !$$$$$e,      ;  .$$$$$$$$",
"$$$$$$$$$   `.$$$$$$$$$$$$     $$$.         .$$$   $$$$$$$$$$$$.'   $$$$$$$$$",
"$$$$$$$$    .$$$$$$$$$$$$$!     $$`$$$$$$$$'$$    !$$$$$$$$$$$$$.    $$$$$$$$",
"$$$$$$$     $$$$$$$$$$$$$$$$.    $    $$    $   .$$$$$$$$$$$$$$$$     $$$$$$$",
"                                 $    $$    $                                ",
"                                 $.   $$   .$                                ",
"                                 `$        $'                                ",
"                                  `$$$$$$$$'                                 "
]]
--
