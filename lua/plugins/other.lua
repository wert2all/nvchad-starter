return {
  {
    "rgroli/other.nvim",
    opts = {
      mappings = { "angular", "golang" },
    },
    keys = {
      {
        "<leader>o",
        "<cmd>Other<cr>",
        desc = "Open other file",
      },
    },
    config = function(_, opts)
      require("other-nvim").setup(opts)
    end,
  },
}
