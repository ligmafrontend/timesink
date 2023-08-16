local default_plugins = {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    cmd = "Telescope",
    dependencies = {
      'nvim-lua/plenary.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
    },
    opts = require "plugins.configs.telescope".opts,
    config = require "plugins.configs.telescope".config,
  },

  {
    "echasnovski/mini.move",
    keys = require("plugins.configs.mini_move").keys,
    opts = require("plugins.configs.mini_move").opts,
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    opts = require("plugins.configs.mason").opts,
    config = require("plugins.configs.mason").config,
  },

  {
    "nvim-tree/nvim-web-devicons",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall" },
    build = ":TSUpdate",
  },

  {
    "neovim/nvim-lspconfig",
    init = require("plugins.configs.lspconfig").init,
    config = require("plugins.configs.lspconfig").config,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = require("plugins.configs.nvimtree").init,
    opts = require("plugins.configs.nvimtree").opts,
    config = require("plugins.configs.nvimtree").config,
  },

  {
    "goolord/alpha-nvim",
    lazy = false,
    opts = require("plugins.configs.alpha").opts,
    config = require("plugins.configs.alpha").config,
  },

  {
    "numToStr/Comment.nvim",
    init = require("plugins.configs.comment").init,
    config = require("plugins.configs.comment").config,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = require("plugins.configs.indent_blankline").opts,
    config = require("plugins.configs.indent_blankline").config,
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = require("plugins.configs.colorizer").opts,
    config = require("plugins.configs.colorizer").config,
  },

  -- theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = require("plugins.configs.theme").opts,
    config = require("plugins.configs.theme").config,
  },

  {
    "folke/which-key.nvim",
  },
}

local config = require("core.utils").get_config()


require("lazy").setup(default_plugins, config)
