-- NOTE: [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NOTE:
-- barbar keymaps
--
-- Move to previous/next
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-H>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A-L>', '<Cmd>BufferMoveNext<CR>', opts)
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
map('n', '<A-w>', '<Cmd>BufferClose<CR>', opts)
-- restore buffer
map('n', '<A-r>', '<Cmd>BufferRestore <CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BuffeCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
map('n', '<leader>ba', '<Cmd> BufferCloseAllButCurrent <CR>', opts)
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be usedlocal map = vim.api.nvim_set_keymap

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

-- toggle lazy
map('n', '<leader>l', '<Cmd>Lazy <CR>', { desc = 'open lazyvim' })

-- toggle main menu
map('n', '<leader>m', '<Cmd> Alpha <CR>', { desc = '[m]ain menu' })

-- NOTE: terminal shortcuts
map('n', '<leader>o', '<Cmd> terminal <CR>', { desc = '[O]pen terminal' })
-- enter normal mode
map('t', '<C-\\>', '<C-\\><C-n>', { noremap = true })

map('n', '<leader>M', '<Cmd> Mason <CR>', { desc = 'open [M]ason' })

map('n', '<leader>si', '<Cmd> NvimWebDeviconsHiTest <CR>', { desc = '[s]earch [i]cons' })

-- NOTE: react shortcuts
--
-- useEffect boilerplate
map('n', '<leader>rue', 'auseEffect(()=>{}, []);<Esc>b3hi<CR><Esc>O', { unpack(opts), desc = '[r]eact [u]se [e]ffect' })

local function toggle_diagnostic_float()
  if vim.diagnostic.open_float then
    vim.diagnostic.open_float()
  else
    vim.diagnostic.close()
  end
end

map('n', 'm', toggle_diagnostic_float)

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have coliding keymaps or are not able to send distinct keycodes
-- map("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- map("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- map("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- map("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
