-- NOTE: [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`
--

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- NOTE: buffer navigation

-- left
map('n', 'H', '<cmd>bp<CR>', opts)
-- right
map('n', 'L', '<cmd>bn<CR>', opts)
-- delete
map('n', 'X', '<cmd>bd<CR>', opts)
-- restore previously deleted buffer
map('n', '<leader>u', function()
  local last = table.remove(vim.g.recently_closed_buffers)
  if last then
    vim.cmd('edit ' .. vim.fn.fnameescape(last))
  end
end, { desc = 'Reopen last closed buffer' })

-- NOTE: todo-comments

map(
  'n',
  '<leader>st',
  '<Cmd> TodoTelescope keywords=TODO <CR>',
  { desc = '[S]earch [T]odos in current directory' }
)
map(
  'n',
  '<leader>sN',
  '<Cmd> TodoTelescope keywords=NOTE <CR>',
  { desc = '[S]earch [N]otes' }
)

-- NOTE: saving folds in files / loading them
map('n', '<leader>zs', function()
  vim.cmd 'mkview'
  print 'saved folds'
end, {
  desc = 'save folds in current file',
})

map('n', '<leader>zl', function()
  vim.cmd 'loadview'
  print 'loaded folds'
end, {
  desc = 'load folds for current file',
})

-- toggle lazy menu
map('n', '<leader>l', '<Cmd>Lazy <CR>', { desc = 'open lazyvim' })

-- toggle mason menu
map('n', '<leader>M', '<Cmd> Mason <CR>', { desc = 'open [M]ason' })

-- toggle main menu
map('n', '<leader>m', '<Cmd> Alpha <CR>', { desc = '[m]ain menu' })

-- toggle terminal
map('n', '<leader>o', '<Cmd> terminal <CR>', { desc = '[O]pen terminal' })
-- enter normal mode from terminal
map('t', '<C-\\>', '<C-\\><C-n>', { noremap = true })

-- NOTE: Javascript shortcuts

map(
  'n',
  '<leader>ja',
  'a() => {}<Esc>',
  { desc = '[J]avaScript [A]rrow function', unpack(opts) }
)

map(
  'n',
  '<leader>jf',
  'afor () {}<Esc>3h',
  { desc = '[J]avaScript [F]or loop', unpack(opts) }
)

-- NOTE: react shortcuts

map(
  'n',
  '<leader>jrue',
  'auseEffect(()=>{}, []);<Esc>b3hi<CR><Esc>O',
  { unpack(opts), desc = '[r]eact [u]se [e]ffect' }
)

-- NOTE: diagnostics
local function toggle_diagnostic_float()
  if vim.diagnostic.open_float then
    vim.diagnostic.open_float()
  else
    vim.diagnostic.close()
  end
end

map('n', 'm', toggle_diagnostic_float)

-- Diagnostic keymaps
map(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  { desc = 'Open diagnostic [Q]uickfix list' }
)

-- Clear highlights from search
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<C-c>', '<cmd>nohlsearch<CR>')

map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- NOTE: Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', 'ZZ', '<cmd>xa<CR>', { desc = 'Save all changed buffers and quit.' })

map('n', 's', '<cmd>w<CR>', { desc = '[S]ave current file' })
map('n', 'S', '<cmd>wa<CR>', { desc = '[S]aves all files' })

-- weirdness for macbook cuz delete key broke
map('i', '<C-h>', '<BS>', { desc = 'delete previous character', unpack(opts) })
map('i', '<C-d>', '<Del>', { desc = 'delete next character', unpack(opts) })
map('i', '<C-f>', '<Esc>la', { desc = 'move to next character', unpack(opts) })

map(
  'i',
  '<S-Tab>',
  '<Esc>',
  { desc = 'escape insert mode (additional binding)', unpack(opts) }
)

map('n', '<leader>R', '<cmd>checktime<CR>', {
  desc = '[R]eload the current file (updates with any outside changes, prompts if conflict)',
  unpack(opts),
})

map('n', '<leader>h', function()
  local col = vim.opt.colorcolumn
  if col._value == '80' then
    vim.opt.colorcolumn = ''
  else
    vim.opt.colorcolumn = '80'
  end
end, { desc = 'Toggle visually marking column 80' })

map(
  'n',
  '<leader>so',
  '<cmd>Telescope oldfiles<CR>',
  { desc = '[s]earch [o]ldfiles (recent files)' }
)

-- Yazi
map(
  'n',
  '-',
  '<cmd>Yazi<cr>',
  { desc = 'Open yazi at the current file', unpack(opts) }
)

map('n', '\\', '<cmd>Yazi cwd<cr>', { desc = 'Open yazi at cwd', unpack(opts) })

map(
  'n',
  '<c-\\>',
  '<cmd>Yazi toggle<cr>',
  { desc = 'Resume the last yazi session', unpack(opts) }
)

map('n', '<leader>w', function()
  local wrap = vim.opt.wrap
  if wrap._value then
    vim.cmd 'set nowrap'
  else
    vim.cmd 'set wrap'
  end
end, { desc = '[w]rap text toggle' })
