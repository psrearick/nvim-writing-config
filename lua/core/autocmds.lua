-- Autocommands for various events

local function augroup(name)
  return vim.api.nvim_create_augroup("kickstart_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('highlight_yank'),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable netrw (if using a different file explorer)
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
