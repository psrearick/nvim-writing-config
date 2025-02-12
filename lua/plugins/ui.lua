-- UI-related plugins (colorscheme, statusline, etc.)

return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('onedark_dark')
      vim.cmd.hi('Comment gui=none')
    end,
  },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.statusline').setup({ use_icons = vim.g.have_nerd_font })
      require('mini.statusline').section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
}
