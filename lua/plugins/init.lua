-- Main plugin configuration and lazy.nvim setup

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'plugins.which-key' },
  { import = 'plugins.ui' },
  { import = 'plugins.editor' },
  { import = 'plugins.autopairs' },
  { import = 'plugins.neo-tree' },
  { import = 'plugins.coding' },
  { import = 'plugins.gitsigns-keymap' },
--   { import = 'plugins.lint' },
  { import = 'plugins.lsp' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤',
    },
  },
})
