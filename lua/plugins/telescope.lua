return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Git commits" },
    { "<leader>gt", "<cmd>Telescope git_status<CR>", desc = "Git status" },

    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help page" },
    { "<leader>fm", "<cmd>Telescope marks<CR>", desc = "Find marks" },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Find old files" },
    {
      "<leader>ft",
      function()
        require("nvchad.themes").open()
      end,
      desc = "Find themes",
    },
  },
}
