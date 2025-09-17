return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    -- https://github.com/projekt0n/github-nvim-theme
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
        },
      })
    end,
  },
  {
    -- https://github.com/zenbones-theme/zenbones.nvim
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.zenbones = {
        transparent_background = true,
        italic_comments = true,
        -- Options: 'zenbones', 'zenwritten', 'zenburned', 'nordbones', 'forestbones', 'tokyobones', 'rosenones', 'vimbones', 'neobones', 'seoulbones' or 'duckbones'
        variant = "zenbones",
      }
    end,
  },
  { "ellisonleao/gruvbox.nvim" },
}
