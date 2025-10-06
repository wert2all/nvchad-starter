return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      sh = { "shellcheck" },
      zsh = { "shellcheck" },
      lua = { "luacheck" },
    },
  },
}
