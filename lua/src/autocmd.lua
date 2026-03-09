-- NOTE: [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup(
    'kickstart-highlight-yank',
    { clear = true }
  ),
  callback = function()
    vim.highlight.on_yank()
  end,
})

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

-- syntax highlighting for svelte its hacky but for some
-- reason treesitter isnt starting on svelte file entry
vim.api.nvim_create_autocmd('filetype', {
  pattern = { 'svelte', 'markdown' },
  callback = function()
    vim.treesitter.start()
  end,
})

-- on buffer delete, store in global buffer table
vim.api.nvim_create_autocmd('BufDelete', {
  callback = function(ev)
    local name = vim.api.nvim_buf_get_name(ev.buf)
    if name ~= '' then
      -- have to store global table in local variable
      local t = vim.g.recently_closed_buffers or {}
      table.insert(t, name)
      vim.g.recently_closed_buffers = t
    end
  end,
})
