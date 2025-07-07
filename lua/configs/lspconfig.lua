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

-- Lsp mappings
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local map = vim.keymap.set

    map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
    map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })

    map({ "n", "x" }, "gra", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
    map({ "n", "x" }, "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })

    map("n", "grn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
    map("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })

    map("n", "grr", vim.lsp.buf.references, { buffer = bufnr, desc = "References" })
    map("n", "<leader>lR", vim.lsp.buf.references, { buffer = bufnr, desc = "References" })

    map("n", "gri", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Implementation" })
    map("n", "gy", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Definition of current type" })

    map({ "i", "s" }, "<C-S>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })
  end,
})
