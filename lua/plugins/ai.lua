return {
  {
    "yetone/avante.nvim",
    opts = {
      provider = "gemini",
      providers = {
        openrouter = {
          __inherited_from = "openai",
          endpoint = "https://openrouter.ai/api/v1",
          api_key_name = "OPENROUTER_API_KEY",
          -- disable_tools = true,
          model = "meta-llama/llama-4-maverick:free",
        },
        mistral = {
          __inherited_from = "openai",
          api_key_name = "MISTRAL_API_KEY",
          endpoint = "https://api.mistral.ai/v1/",
          model = "codestral-latest",
          max_tokens = 4096, -- to avoid using max_completion_tokens
        },
      },
    },
  },
}
