return function(use)
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end
  })
  use({
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
  })
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  })
  use({ "nvim-telescope/telescope-file-browser.nvim" })
  use({ "ThePrimeagen/harpoon", requires = "nvim-lua/plenary.nvim" })
  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = "<super-space>",
      })
    end,
  })
  use({
    "AckslD/nvim-pytrize.lua",
    config = function()
      require("pytrize").setup()
    end,
  })

  use("ThePrimeagen/vim-be-good")
  use("jose-elias-alvarez/typescript.nvim")
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require "telescope".load_extension("frecency")
    end,
    requires = { "kkharji/sqlite.lua" }
  }
  use("jose-elias-alvarez/null-ls.nvim")

end
