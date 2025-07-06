return {
  "lewis6991/gitsigns.nvim",

  opts = function(_, opts)
    local o = {
      on_attach = function()
        local gitsigns = require "gitsigns"

        local map = vim.keymap.set

        map("n", "<leader>gr", function()
          gitsigns.reset_hunk()
        end, { desc = "Reset Git hunk" })

        map("v", "<leader>gr", function()
          gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "Reset Git hunk" })

        map("n", "<leader>gR", function()
          gitsigns.reset_buffer()
        end, { desc = "Reset Git buffer" })

        map("n", "<leader>gd", function()
          gitsigns.diffthis()
        end, { desc = "View Git diff" })

        map("n", "<leader>gl", function()
          gitsigns.blame_line()
        end, { desc = "View Git blame" })
        map("n", "<leader>gL", function()
          gitsigns.blame_line { full = true }
        end, { desc = "View full Git blame" })
      end,
    }
    return vim.tbl_deep_extend("force", opts, o)
  end,
}
