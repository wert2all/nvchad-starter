return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
      {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          if opts.ensure_installed ~= "all" then
            opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "markdown" })
          end
        end,
      },
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
                default = "meta-llama/llama-4-maverick:free",
              },
            },
          })
        end,
      },
    },
  },
}
