return {
  "folke/which-key.nvim",
  config = function(_, opts)
    require("which-key").setup(vim.tbl_deep_extend("force", opts, {
      preset = "modern",
      icons = {
        rules = false,
        breadcrumb = " ",
        separator = "󱦰  ",
        group = "󰹍 ",
      },
      plugins = {
        spelling = {
          enabled = false,
        },
      },
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>f", group = "Find" },
          { "<leader>g", group = "Git" },
          { "[", group = "prev" },
          { "]", group = "next" },
          { "g", group = "goto" },
        },
      },
    }))
  end,
}
