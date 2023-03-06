-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: lazy.nvim
-- URL: https://github.com/folke/lazy.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

-- Start setup
lazy.setup({
  spec = {
    -- Colorscheme:
    -- The colorscheme should be available when starting Neovim.
    {
      'navarasu/onedark.nvim',
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
    },

    -- other colorschemes:
    { 'tanvirtin/monokai.nvim', lazy = true },
    { 'https://github.com/rose-pine/neovim', name = 'rose-pine', lazy = true },

    -- Icons
    { 'kyazdani42/nvim-web-devicons', lazy = true },

    -- Dashboard (start screen)
    {
      'goolord/alpha-nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- Git labels
    {
      'lewis6991/gitsigns.nvim',
      lazy = true,
      dependencies = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require('gitsigns').setup{}
      end
    },

    -- File explorer
    {
      'kyazdani42/nvim-tree.lua',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- Statusline
    {
      'freddiehaddad/feline.nvim',
      dependencies = {
        'kyazdani42/nvim-web-devicons',
        'lewis6991/gitsigns.nvim',
      },
    },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- Indent line
    { 'lukas-reineke/indent-blankline.nvim' },

    -- Tag viewer
    { 'preservim/tagbar' },

    -- Autopair
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require('nvim-autopairs').setup{}
      end
    },

    -- LSP
    { 'neovim/nvim-lspconfig' },

    -- Autocomplete
    {
      'hrsh7th/nvim-cmp',
      -- load cmp on InsertEnter
      event = 'InsertEnter',
      -- these dependencies will only be loaded when cmp loads
      -- dependencies are always lazy-loaded unless specified otherwise
      dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
      },
    },
   {
     "kylechui/nvim-surround",
    -- tag = "*",
     config = function()
      require("nvim-surround").setup{}
     end
    },


    {
     "folke/which-key.nvim",
     config = function()
     vim.o.timeout = true
     vim.o.timeoutlen = 300
      require("which-key").setup {}
     end
    },


   -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

	{'folke/tokyonight.nvim'},



  },
})
