-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NOTE:
-- barbar keymaps

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be usedlocal map = vim.api.nvim_set_keymap
local barbarOpts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', barbarOpts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', barbarOpts)

-- Re-order to previous/next
map('n', '<A-H>', '<Cmd>BufferMovePrevious<CR>', barbarOpts)
map('n', '<A-L>', '<Cmd>BufferMoveNext<CR>', barbarOpts)

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', barbarOpts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', barbarOpts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', barbarOpts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', barbarOpts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', barbarOpts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', barbarOpts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', barbarOpts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', barbarOpts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', barbarOpts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', barbarOpts)

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', barbarOpts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
map('n', '<A-w>', '<Cmd>BufferClose<CR>', barbarOpts)

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', barbarOpts)
map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', barbarOpts)

-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', barbarOpts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', barbarOpts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', barbarOpts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', barbarOpts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', barbarOpts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- NOTE: todo-comments
map('n', '<leader>st', '<Cmd> TodoTelescope keywords=TODO <CR>', { desc = '[S]earch [T]odos in current directory' })
map('n', '<leader>sN', '<Cmd> TodoTelescope keywords=NOTE <CR>', { desc = '[S]earch [N]otes' })

-- NOTE: saving folds in files / loading them
map('n', '<leader>zs', function()
  vim.cmd ':mkview'
  print 'saved folds'
end, {
  desc = 'save folds in current file',
})

map('n', '<leader>zl', function()
  vim.cmd ':loadview'
  print 'loaded folds'
end, {
  desc = 'load folds for current file',
})

-- NOTE: shortcut for opening lazyvim
map('n', '<leader>l', '<Cmd>Lazy <CR>', { desc = 'open lazyvim' })

-- NOTE:  open main menu
map('n', '<leader>m', '<Cmd> Alpha <CR>', { desc = '[M]ain Menu' })
