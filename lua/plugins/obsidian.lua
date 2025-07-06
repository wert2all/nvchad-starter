local vaultDirectory = "Documents/obsidian"
local templatesSubdir = "Templates"
local dailyFolder = "Daily"

return {
  "obsidian-nvim/obsidian.nvim",
  event = { "BufReadPre " .. vim.fn.expand "~/" .. vaultDirectory .. "/**.md" },
  keys = {
    {
      "<leader>On",
      function()
        require "obsidian"
        vim.api.nvim_command("Obsidian new inbox/" .. os.date "%Y-%m-%d" .. "-note.md")
      end,
      desc = "Create new Obsidian note in income folder",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "hrsh7th/nvim-cmp", optional = true },
  },
  opts = {
    workspaces = {
      {
        path = vim.env.HOME .. "/" .. vaultDirectory,
      },
    },
    open = {
      use_advanced_uri = true,
    },
    finder = "telescope.nvim",
    templates = {
      subdir = templatesSubdir,
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },
    daily_notes = {
      folder = dailyFolder,
    },
    completion = {
      blink = true,
    },
    follow_url_func = vim.ui.open,
  },
}
