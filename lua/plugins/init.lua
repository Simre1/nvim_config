return {
  {
    "folke/tokyonight.nvim",
    lazy = false, 
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  { "folke/which-key.nvim", lazy = true },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          undo = {
          mappings = {
            i = {
              ["<C-cr>"] = require("telescope-undo.actions").yank_additions,
              ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
              ["<cr>"] = require("telescope-undo.actions").restore,
            },
          }
                      -- telescope-undo.nvim config, see below
          },
        },
      })
      require("telescope").load_extension("undo")
    end,
  },
  { 
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    event = UIEnter,
    config = function()
      require("nvim-tree").setup()
    end
  },
  {
    "terrortylor/nvim-comment",
    event = "UIEnter",
    config = function()
      require('nvim_comment').setup({
        line_mapping = "<leader>cc",
        operator_mapping = "<leader>c"
      })
    end
  },
  {
    "kylechui/nvim-surround",
    event = "UIEnter",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "folke/zen-mode.nvim",
    event = "UIEnter",
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 1,
          width = 90
        }
      })
    end
  },
  {
    "ggandor/leap.nvim",
    event = "UIEnter",
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup()
    end,
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },
  {
    'max397574/better-escape.nvim',
    config = function()
      require("better_escape").setup()
    end
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('trouble').setup {}
    end
  },
  {
      "nvim-neorg/neorg",
      build = ":Neorg sync-parsers",
      opts = {
          load = {
              ["core.defaults"] = {}, -- Loads default behaviour
              ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
              ["core.norg.dirman"] = { -- Manages Neorg workspaces
                  config = {
                      workspaces = {
                          notes = "~/Documents/notes",
                      },
                  },
              },
          },
      },
      dependencies = { { "nvim-lua/plenary.nvim" } },
  }
}

