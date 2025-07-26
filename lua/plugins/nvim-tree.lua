return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    {
      "<leader>e",
      "<cmd>:NvimTreeToggle<cr>",
      desc = "Toggle NeoTree",
    },
  },
  opts = {
    filters = {
      dotfiles = false,
    },
    view = {
      float = {
        enable = true,
        open_win_config = {
          relative = "editor",
          border = "none",
        },
      },
    },
  },
  config = function(_, opts)
    local nvim_tree = require "nvim-tree"
    local gwidth = vim.api.nvim_list_uis()[1].width
    local gheight = vim.api.nvim_list_uis()[1].height
    local width = 60
    local height = 20

    local config = vim.tbl_deep_extend("force", opts, {
      view = {
        float = {
          open_win_config = {
            width = width,
            height = height,
            row = (gheight - height) * 0.4,
            col = (gwidth - width) * 0.5,
          },
        },
      },
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        -- Default mappings from nvim-tree
        api.config.mappings.default_on_attach(bufnr)

        -- Add custom mapping for ESC to close the tree (only when it's open in float mode)
        vim.keymap.set("n", "<Esc>", function()
          -- Check if we're in a floating window (the nvim-tree)
          local win_id = vim.api.nvim_get_current_win()
          local win_config = vim.api.nvim_win_get_config(win_id)

          -- Only close if it's actually a floating window
          if win_config.relative ~= "" then
            api.tree.close()
          end
        end, { desc = "Close the tree", buffer = bufnr, noremap = true, silent = true })
      end,
    })

    nvim_tree.setup(config)
  end,
}
