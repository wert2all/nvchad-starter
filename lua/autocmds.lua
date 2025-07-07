require "nvchad.autocmds"

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- don't auto comment new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- add filetype for docker
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "docker-compose*.yml",
    "docker-compose*.yaml",
    "*docker-compose.yml",
    "*docker-compose.yaml",
    "compose.yaml",
    "compose.yml",
  },
  callback = function()
    vim.bo.filetype = "yaml.docker-compose"
  end,
})

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
