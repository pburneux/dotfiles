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

-----------------------------------------------------------
-- Nvim controls
----------------------------------------------------------

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and w
map('n', '<leader>w', ':w<CR>')

-- fast quiting buffer
map('n', '<leader>q', ':bdelete<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>Q', ':qa!<CR>')

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to kk and jj
map('i', 'kk', '<Esc>')
map('i', 'jj', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Reselect visual selection after indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Easy insertion of a trailing ; or , from insert mode
map('i', ';;', '<Esc>A;<Esc>')
map('i', ',,', '<Esc>A,<Esc>')

-- Move text up and down
map('n', '<A-j>', ':move .+1<CR>==') -- TODO: Something seems to be sending Alt occasionally and makes me mess up
map('n', '<A-k>', ':move .-2<CR>==') -- TODO: Something seems to be sending Alt occasionally and makes me mess up
map('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
map('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
map('x', '<A-j>', ":move '>+1<CR>gv-gv")
map('x', '<A-k>', ":move '<-2<CR>gv-gv")

-----------------------------------------------------------
-- Buffer Splits and Controls
-----------------------------------------------------------

-- easy splits
map('n', '<leader>V', ':vsp<CR>')
map('n', '<leader>P', ':sp<CR>')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- NvimTree
map('n', '<leader>n', ':NvimTreeToggle<CR>')

-- Prettier
map('n', '<leader>p', ':Prettier<CR>')

-- Import
map('n', '<leader>i', ':TSLspImportAll<CR>')
map('n', '<leader>io', ':TSLspOrganize<CR>')

-- Float term
map('n', '<F1>', ':FloatermToggle scratch<CR>')
map('t', '<F1>', '<C-\\><C-n>:FloatermToggle scratch<CR>')


-- Telescope
map('n', '<leader>ff', ':Telescope git_files<CR>')
map('n', '<leader>fl', ':Telescope current_buffer_fuzzy_find<CR>')
