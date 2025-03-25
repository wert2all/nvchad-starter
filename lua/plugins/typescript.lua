return {
  {
    "dmmulroy/tsc.nvim",
    cmd = "TSC",
    opts = {},
  },
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    event = "BufRead package.json",
  },
}
