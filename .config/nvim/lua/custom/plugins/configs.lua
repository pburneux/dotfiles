local M = {}

-- overriding default plugin configs!
M.treesitter = {
   ensure_installed = {
      "lua",
      "vim",
      "html",
      "css",
      "javascript",
      "json",
      "toml",
      "markdown",
      "c",
      "bash",
   },
   pickers = {
      git_files = { hidden = true },
      find_files = { hidden = true },
      live_grep = {
         additional_args = function(opts)
            return { "--hidden" }
         end,
      },
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
}

return M
