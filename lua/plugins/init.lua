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
     event = "UIEnter",
     dependencies = {
       "nvim-lua/plenary.nvim"
     }
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
  }
}

