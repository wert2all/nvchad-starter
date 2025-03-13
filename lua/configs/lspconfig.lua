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
  html = {},
  bashls = {},
  cssls = {},
  angularls = {
    cmd = cmd,
    on_new_config = function(new_config, new_root_dir)
      new_config.cmd = cmd
    end,
  },
}

vim.lsp.enable(servers)
