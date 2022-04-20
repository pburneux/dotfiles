-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- See: https://github.com/brainfucksec/neovim-lua#appearance


-- Load nvim color scheme:
-- Change the "require" values with your color scheme
-- Available color schemes: onedark, monokai, rose-pine
local status_ok, color_scheme = pcall(require, 'onedark')
if not status_ok then
  return
end

-- OneDark styles: dark, darker, cool, deep, warm, warmer, light
require('onedark').setup {
  style = 'darker',
  colors = { fg = '#b2bbcc' }, --default: #a0a8b7
}
require('onedark').load()

-- With these functions you can import color scheme for other components
-- (i.e. statusline) with: require('colors').colorscheme_name
local M = {}

M.neutron = {
  bg = '#1b1d22',
  fg = '#e6e8ee',
  pink = '#a3799d',
  green = '#5ab977',
  cyan = '#3f93a8',
  yellow = '#e5c07b',
  orange = '#d19a66',
  red = '#b53f36',
}

return M

