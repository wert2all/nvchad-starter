return {
  "folke/which-key.nvim",
  config = function(_, opts)
    require("which-key").setup(vim.tbl_deep_extend("force", opts, {
      preset = "modern",
      icons = {
        breadcrumb = " ",
        separator = "󱦰  ",
        -- group = "󰹍 ",
        group = "",
        mappings = true,
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
          { "<leader>l", group = "Lsp", icon = "󰘦" },
          { "<leader>O", group = "Obsidian", icon = "" },
          { "[", group = "prev" },
          { "]", group = "next" },
          { "g", group = "goto" },
        },
      },
    }))
  end,
}
