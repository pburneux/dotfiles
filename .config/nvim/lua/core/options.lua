-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd     				      -- Execute Vim commands
local exec = vim.api.nvim_exec 	      -- Execute Vimscript
local g = vim.g         				      -- Global variables
local opt = vim.opt         		      -- Set options (global/buffer/windows-scoped)
local fn = vim.fn       				      -- Call Vim functions

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = 'menuone,noselect'  -- Autocomplete options
vim.o.clipboard = 'unnamedplus'       -- Use linux system clipboard

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.title = true		      -- Set title to titlestring
opt.number = true                     -- Show line number
opt.relativenumber = true             -- Make line number relative
opt.showmatch = true                  -- Highlight matching parenthesis
opt.foldmethod = 'marker'             -- Enable folding (default 'foldmarker')
opt.colorcolumn = '80'                -- Line lenght marker at 80 columns
opt.splitright = true                 -- Vertical split to the right
opt.splitbelow = true                 -- Orizontal split to the bottom
opt.ignorecase = true                 -- Ignore case letters when search
opt.smartcase = true                  -- Ignore lowercase for the whole pattern
opt.termguicolors = true              -- Enable 24-bit RGB colors
opt.signcolumn = "yes:2"	      -- Enable sign column for gitsigns
opt.list = true		              -- Enable list.. :help list
opt.listchars = 'tab:▸ ,trail:·'      -- Show trailing space and tab characters
opt.showmode = false		      -- Showing mode will be handled by status bar

-----------------------------------------------------------
-- Wrapping
-----------------------------------------------------------
opt.scrolloff = 8                     -- Prevent cursor from going to bottom or
opt.sidescrolloff = 8                 -- the side of the window

-----------------------------------------------------------
-- Wrapping
-----------------------------------------------------------
opt.wrap = true                       -- Wrap lines
opt.linebreak = true                  -- Wrap on word boundary
opt.showbreak = '>>'                  -- Show characters on broken line
opt.textwidth = 80                    -- Break at this amount
opt.breakindent = false               -- Indent wrapped line

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true                  -- Use spaces instead of tabs
opt.shiftwidth = 4                    -- Shift 4 spaces when tab
opt.tabstop = 4                       -- 1 tab == 4 spaces
opt.smartindent = true                -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true                     -- Enable background buffers
opt.history = 100                     -- Remember N lines in history
opt.lazyredraw = true                 -- Faster scrolling
opt.synmaxcol = 240                   -- Max column for syntax highlight
opt.updatetime = 250                  -- ms to wait for trigger an event

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------

-- Disable nvim intro
opt.shortmess:append "sI"

-- Disable builtins plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end

-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------

-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=800}
  augroup end
]], false)

-- Remove whitespace on save
cmd [[autocmd BufWritePre * :%s/\s\+$//e]]

-- Don't auto commenting new lines
cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

-- Remove line lenght marker for selected filetypes
cmd [[
  autocmd FileType text,markdown,html,xhtml,javascript,typescript,javascriptreact,typescriptreact setlocal cc=0
]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,json,lua,yaml,typescript,typescriptreact,javascriptreact setlocal shiftwidth=2 tabstop=2
]]

-- auto close nvim-tree when last window
-- cmd [[
-- autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- ]]

-----------------------------------------------------------
-- Terminal theme
-----------------------------------------------------------

cmd([[
    " Neutron Bg
    hi Floaterm guibg=#1b1d22
    hi FloatermBorder guifg=#1b1d22 guibg=#1b1d22
]])


