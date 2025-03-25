require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local install_path = vim.fn.stdpath "data" .. "/mason/packages/angular-language-server/node_modules"

local cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  install_path,
  "--ngProbeLocations",
  install_path .. "/@angular/language-server/node_modules",
}

local configs = require "nvchad.configs.lspconfig"

local servers = {
  bashls = {},

  jsonls = {},
  html = { init_options = { provideFormatter = false } },
  cssls = { init_options = { provideFormatter = false } },
  emmet_ls = {},
  angularls = {
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
      new_config.cmd = cmd
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
}

vim.lsp.enable(servers)
