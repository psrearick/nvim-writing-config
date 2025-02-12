-- General Neovim settings and options

local opt = vim.opt
local g = vim.g

-- UI Elements
opt.number = true          -- Show line numbers
opt.showmode = false       -- Don't show mode in command line (statusline handles this)
opt.signcolumn = 'yes'     -- Always show the signcolumn
opt.cursorline = true      -- Highlight current line
opt.scrolloff = 10         -- Minimum lines to keep above/below cursor
opt.inccommand = 'split' -- Show command preview as you type
opt.list = true           -- Show whitespace characters
opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣'
}

-- Splits and Windows
opt.splitright = true      -- New vertical splits go right
opt.splitbelow = true      -- New horizontal splits go below

-- Search
opt.ignorecase = true      -- Case insensitive search
opt.smartcase = true       -- Unless search contains uppercase

-- Performance
opt.updatetime = 250       -- Faster completion
opt.timeoutlen = 300       -- Time to wait for mapped sequence

-- File Handling
opt.undofile = true       -- Persistent undo history
opt.breakindent = true    -- Maintain indent when wrapping

-- System Integration
g.have_nerd_font = true   -- Enable if using a Nerd Font
opt.mouse = 'a'           -- Enable mouse support

-- Schedule clipboard setup for better startup time
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)
