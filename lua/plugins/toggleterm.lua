-- Terminal Manager

return {
  'akinsho/toggleterm.nvim',
  dependencies = {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        defaults = {
          ["<leader>tt"] = { name = "+terminal" },
        },
      },
  },
  version = "*",
  config = true
}
