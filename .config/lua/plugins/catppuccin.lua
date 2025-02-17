return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- Available flavours: latte, frappe, macchiato, mocha
      background = { light = "mocha" },
      transparent_background = true,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = true,
        -- For more plugins integrations see https://github.com/catppuccin/nvim#integrations
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
    end,
  },
}
