--------------------------------
-- OPTIONS
--------------------------------
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.signcolumn = 'yes:2'
vim.o.relativenumber = true
vim.o.number = true
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.spell = false
vim.o.title = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wildmode = 'longest:full,full'
vim.o.list = true
vim.o.listchars = 'tab:▸ ,trail:·'
vim.o.mouse = 'a'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.clipboard = 'unnamedplus' -- Use Linux system clipboard
vim.o.confirm = true
vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath 'data' .. '/backup//'
vim.o.updatetime = 250          -- Decrease CursorHold delay
vim.o.redrawtime = 10000        -- Allow more time for loading syntax on large files
vim.o.showmode = false
vim.o.fillchars = 'eob: '

-- wrapping
vim.o.wrap = true
vim.o.textwidth = 100
vim.o.breakindent = true
vim.o.showbreak = '>>'
vim.o.linebreak = true

--highlights
vim.o.cursorline = true

--------------------------------
-- MAPPINGS
--------------------------------
local map = require("core.utils").map

map("n", "<leader>te", ":Telescope <CR>")

map("n", "<leader>`", ":bd <CR>")
map("n", "<leader>w", ":w <CR>")

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Easy insertion of a trailing ; or , from insert mode
map('i', ';;', '<Esc>A;<Esc>')
map('i', ',,', '<Esc>A,<Esc>')

-- navigation of buffers
map('n', '<leader>J', '<C-W><C-J>')
map('n', '<leader>K', '<C-W><C-K>')
map('n', '<leader>H', '<C-W><C-H>')
map('n', '<leader>L', '<C-W><C-L>')

-- easy splits
map('n', '<leader>V', ':vsp<CR>')
map('n', '<leader>P', ':sp<CR>')

-- Resize with arrows
map('n', '<C-Up>', ':resize +2<CR>')
map('n', '<C-Down>', ':resize -2<CR>')
map('n', '<C-Left>', ':vertical resize -2<CR>')
map('n', '<C-Right>', ':vertical resize +2<CR>')

-- Move text up and down
map('n', '<A-j>', ':move .+1<CR>==') -- TODO: Something seems to be sending Alt occasionally and makes me mess up
map('n', '<A-k>', ':move .-2<CR>==') -- TODO: Something seems to be sending Alt occasionally and makes me mess up
map('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
map('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
map('x', '<A-j>', ":move '>+1<CR>gv-gv")
map('x', '<A-k>', ":move '<-2<CR>gv-gv")

