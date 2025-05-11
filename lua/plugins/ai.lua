return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {
      strategies = {
        chat = {
          adapter = "mistral",
        },
        inline = {
          adapter = "mistral",
        },
        cmd = {
          adapter = "mistral",
        },
      },
      adapters = {
        mistral = function()
          return require("codecompanion.adapters").extend("mistral", {
            env = {
              api_key = os.getenv "MISTRAL_API_KEY",
            },
            schema = {
              model = {
                default = "codestral-latest",
              },
            },
          })
        end,
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
}
