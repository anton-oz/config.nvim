return {
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
