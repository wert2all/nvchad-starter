return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    opts = {
      strategies = {
        chat = {
          adapter = "openrouter",
        },
        inline = {
          adapter = "openrouter",
        },
        cmd = {
          adapter = "openrouter",
        },
      },
      adapters = {
        openrouter = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://openrouter.ai/api",
              api_key = os.getenv "OPENROUTER_API_KEY",
              chat_url = "/v1/chat/completions",
            },
            schema = {
              model = {
                default = "openrouter/optimus-alpha",
              },
            },
          })
        end,
      },
    },
  },
  -- {
  --   "Exafunction/codeium.vim",
  --   cmd = {
  --     "Codeium",
  --     "CodeiumEnable",
  --     "CodeiumDisable",
  --     "CodeiumToggle",
  --     "CodeiumAuto",
  --     "CodeiumManual",
  --   },
  --   event = "BufEnter",
  --   config = function(_, opts)
  --     vim.keymap.set("n", "<Leader>;", "<Cmd>CodeiumToggle<CR>", { desc = "Toggle Codeium active" })
  --
  --     vim.keymap.set("i", "<C-g>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<C-;>", function()
  --       return vim.fn["codeium#CycleCompletions"](1)
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<C-,>", function()
  --       return vim.fn["codeium#CycleCompletions"](-1)
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<C-x>", function()
  --       return vim.fn["codeium#Clear"]()
  --     end, { expr = true, silent = true })
  --   end,
  -- },
}
