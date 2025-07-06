return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format { lsp_fallback = true }
        end,
        mode = { "n", "x" },
        desc = "Format document",
      },
    },
  },
}
