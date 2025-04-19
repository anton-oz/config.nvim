local function toggle_auto_comment()
  local formatoptions = vim.api.nvim_exec2('setlocal formatoptions?', { output = true }).output
  local param_index = string.find(formatoptions, '=')
  print(param_index)
  local params = string.sub(formatoptions, param_index + 1)
  print(params)
  if string.find(params, 'cro') then
    vim.cmd 'setlocal formatoptions-=cro'
    print 'auto comments disabled'
  else
    vim.cmd 'setlocal formatoptions+=cro'
    print 'auto comments enabled'
  end
end

return {
  'toggle_auto_comment',
  dir = '~/.config/nvim/lua/custom',
  keys = {
    { '<leader>tc', toggle_auto_comment, desc = '[T]oggle Auto [C]omments' },
  },
}
