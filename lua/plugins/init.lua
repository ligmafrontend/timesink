local default_plugins = {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    cmd = "Telescope",
    dependencies = {
      'nvim-lua/plenary.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
    },
    opts = function()
      local actions = require "telescope.actions"
      return {
        defaults = {
          git_worktrees = vim.g.git_worktrees,
          --prompt_prefix = get_icon("Selected", 1),
          --selection_caret = get_icon("Selected", 1),
          path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55 },
            vertical = { mirror = false },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
            n = { q = actions.close },
          },
        },
      }
    end,
    config = require "plugins.configs.telescope",
  },

  {
    "echasnovski/mini.move",
    keys = require("plugins.configs.mini_move").keys,
    opts = require("plugins.configs.mini_move").opts,
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    opts = function()
      return require "plugins.configs.mason"
    end,
    config = function(_, opts)
      require("mason").setup(opts)
      vim.g.mason_binaries_list = opts.ensure_installed
    end
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
    init = function()
      --    require("core.utils").lazy_load "nvim-lspconfig"
    end,
    config = function()
      --- require "plugins.configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
      require("core.utils").load_mappings "nvimtree"
    end,
    opts = function()
      return require "plugins.configs.nvimtree"
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },

  {
    "goolord/alpha-nvim",
    lazy = false,
    opts = require "plugins.configs.alpha".opts,
    config = require "plugins.configs.alpha".config,
  },

  {
    "numToStr/Comment.nvim",
    init = function()
      require("core.utils").load_mappings "comment"
    end,
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },
  -- load whichkey after gui
  {
    "folke/which-key.nvim",
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = require("plugins.configs.colorizer").opts,
    config = require "plugins.configs.colorizer".config,
  },

  -- theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      }
    },
    config = require("plugins.configs.theme"),
  }
}

local config = require("core.utils").get_config()


require("lazy").setup(default_plugins, config)
