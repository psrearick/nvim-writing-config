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

-- Auto-clean unused buffers
local augroup = vim.api.nvim_create_augroup("buffer_cleanup", { clear = true })
vim.api.nvim_create_autocmd("BufLeave", {
  group = augroup,
  callback = function()
    -- Get all windows in all tabs
    local all_windows = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      all_windows[vim.api.nvim_win_get_buf(win)] = true
    end

    -- Check if buffer is hidden and modified
    local bufnr = vim.api.nvim_get_current_buf()
    if not all_windows[bufnr] and not vim.bo[bufnr].modified then
      -- Only delete buffer if it's not being displayed and not modified
      vim.cmd("bd " .. bufnr)
    end
  end,
})
