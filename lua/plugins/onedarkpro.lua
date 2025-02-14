-- colorscheme

return {
  'olimorris/onedarkpro.nvim',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme('onedark')
    vim.cmd.hi('Comment gui=none')
  end,
}
