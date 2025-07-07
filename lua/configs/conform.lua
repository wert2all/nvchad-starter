local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    html = { "prettierd", "prettier", stop_after_first = true },
    css = { "prettierd", "prettier", stop_after_first = true },
    scss = { "prettierd", "prettier", stop_after_first = true },
    less = { "prettierd", "prettier", stop_after_first = true },
    postcss = { "prettierd", "prettier", stop_after_first = true },
    php = { "php_cs_fixer" },
    sh = { "shfmt", "shellcheck" },
    zsh = { "shfmt", "shellcheck" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

return options
