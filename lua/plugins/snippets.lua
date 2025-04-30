return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      -- snippet plugin
      "L3MON4D3/LuaSnip",
      config = function(_, opts)
        require("luasnip").config.set_config(opts)

        local luasnip = require "luasnip"

        luasnip.filetype_extend("html", { "angular" })
        luasnip.filetype_extend("typescript", { "angular" })

        require "nvchad.configs.luasnip"
      end,
    },

    {
      "hrsh7th/cmp-cmdline",
      event = "CmdlineEnter",
      config = function()
        local cmp = require "cmp"

        cmp.setup.cmdline("/", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = { { name = "buffer" } },
        })

        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
          matching = { disallow_symbol_nonprefix_matching = false },
        })
      end,
    },
  },
}
