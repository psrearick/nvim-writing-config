-- Terminal Manager

return {
  'akinsho/toggleterm.nvim',
  dependencies = {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        defaults = {
          -- ["<leader>t"] = { name = "+terminal" },
        },
      },
  },
  keys = { { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" } },
  version = "*",
  config = true
}
