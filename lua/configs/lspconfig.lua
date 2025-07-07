local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_init = require("nvchad.configs.lspconfig").on_init

local install_path = vim.fn.stdpath "data" .. "/mason/packages/angular-language-server/node_modules"

local angular_cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  install_path,
  "--ngProbeLocations",
  install_path .. "/@angular/language-server/node_modules",
}

local servers = {
  bashls = {},

  jsonls = {},
  html = { init_options = { provideFormatter = false } },
  cssls = { init_options = { provideFormatter = false } },
  emmet_ls = {},
  angularls = {
    cmd = angular_cmd,
    on_new_config = function(new_config, _)
      new_config.cmd = angular_cmd
    end,
  },
  vtsls = {
    settings = {
      typescript = {
        updateImportsOnFileMove = { enabled = "always" },
        inlayHints = {
          parameterNames = { enabled = "all" },
          parameterTypes = { enabled = true },
          variableTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          enumMemberValues = { enabled = true },
        },
      },
      javascript = {
        updateImportsOnFileMove = { enabled = "always" },
        inlayHints = {
          parameterNames = { enabled = "literals" },
          parameterTypes = { enabled = true },
          variableTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          enumMemberValues = { enabled = true },
        },
      },
      vtsls = {
        enableMoveToFileCodeAction = true,
      },
    },
  },

  docker_compose_language_service = {},
  dockerls = {},

  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/luv/library",
          },
        },
      },
    },
  },
}

vim.lsp.config("*", { capabilities = capabilities, on_init = on_init })

for name, config in pairs(servers) do
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end
