return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
          vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#7e1b23" })
          vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#815c18" })
          vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#0f558a" })
          vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#754b24" })
          vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#486930" })
          vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#651e7b" })
          vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#296770" })
      end)

      require("ibl").setup { indent = { highlight = highlight, char = "╎" } }
    end
  },
}
