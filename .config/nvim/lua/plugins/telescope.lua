local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup {
  defaults = {
    path_display = { truncate = 1 },
    prompt_prefix = '   ',
    selection_caret = '  ',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-Down>'] = actions.cycle_history_next,
        ['<C-Up>'] = actions.cycle_history_prev,
      },
    },
    file_ignore_patterns = { '.git/' },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = 'History',
    },
    lsp_references = {
      previewer = false,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}

require('telescope').load_extension 'fzf'

-- Telescope theming
local purple = '#58a6ff'
local fg = '#F8F8F2'
local bg_light = '#2e343b'
local bg_lighter = '#4d5566'

vim.cmd("highlight TelescopeNormal guibg = '" .. bg_light .. "'")
vim.cmd("highlight TelescopeBorder guifg = '" .. bg_light .. "' guibg = '" .. bg_light .. "'")
vim.cmd("highlight TelescopePromptBorder guifg = '" .. bg_lighter .. "' guibg = '" .. bg_lighter .. "'")
vim.cmd("highlight TelescopePromptNormal guifg = '" .. fg .. "' guibg = '" .. bg_lighter .. "'")
vim.cmd("highlight TelescopePromptPrefix guifg = '" .. purple .. "' guibg = '" .. bg_lighter .. "'")
vim.cmd("highlight TelescopePromptTitle guifg = '" .. fg .. "' guibg = '" .. purple .. "'")
vim.cmd("highlight TelescopePreviewTitle guifg = '" .. fg .. "' guibg = '" .. purple .. "'")
vim.cmd("highlight TelescopeResultsTitle guifg = '" .. bg_light .. "' guibg = '" .. bg_light .. "'")

vim.cmd([[
  hi Floaterm guifg=#1f2428 guibg=#1f2428
  hi FloatermBorder guifg=#1f2428 guibg=#1f2428
]])
