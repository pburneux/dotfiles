return {

   {
      "windwp/nvim-ts-autotag",
      ft = { "html", "javascriptreact" },
      after = "nvim-treesitter",
      config = function()
         require("nvim-ts-autotag").setup()
      end,
   },

   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
   {
      "williamboman/nvim-lsp-installer",
   },

   { "airblade/vim-rooter" }, -- set root directory to project base
   { "farmergreg/vim-lastplace" }, -- move to last place when opening file
   { "AndrewRadev/splitjoin.vim" }, -- gS and gJ to split single lines to multi and vice versa
   { "voldikss/vim-floaterm" },

   -- tpope magic
   { "tpope/vim-commentary" }, -- add comments
   { "tpope/vim-repeat" }, -- better repeat
   { "tpope/vim-surround" }, -- add surrounding tags and stuff
   { "tpope/vim-eunuch" }, -- Adds :Rename, :SudoWrite
   { "tpope/vim-sleuth" }, -- Indent autodetection with editorconfig support

   -- nvim-colorizer.lua
   {
      "norcalli/nvim-colorizer.lua",
      config = function()
         require("colorizer").setup()
      end,
   },
}
