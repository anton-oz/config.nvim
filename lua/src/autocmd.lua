-- NOTE: [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- DOC:
-- when neovim is called to open directory,
-- also toggle the main menu so when you exit
-- yazi there is not an empty buffer
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local args = vim.fn.argv()
    if #args == 1 and vim.fn.isdirectory(args[1]) == 1 then
      vim.cmd 'Alpha'
      require('yazi').yazi({}, args[1])
    end
  end,
})
