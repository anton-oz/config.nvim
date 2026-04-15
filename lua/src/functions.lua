function toggle_dark_theme()
  local current = vim.g.colors_name or ''
  local new_scheme = current == 'catppuccin-mocha' and 'catppuccin-latte'
    or 'catppuccin-mocha'
  vim.cmd('colorscheme ' .. new_scheme)

  local colorscheme_filepath =
    vim.fn.expand '~/.config/nvim/lua/src/plugins/colorscheme.lua'

  local lines = vim.fn.readfile(colorscheme_filepath)
  local new_lines = {}
  for _, line in ipairs(lines) do
    local new_line = vim.fn.substitute(line, current, new_scheme, '')
    table.insert(new_lines, new_line)
  end
  vim.fn.writefile(new_lines, colorscheme_filepath)
end
