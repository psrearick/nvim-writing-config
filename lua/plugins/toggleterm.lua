-- Terminal Manager

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      direction = 'horizontal',
      open_mapping = [[<leader>tt]], -- This is your existing toggle mapping
    })

    -- Create a function to handle new terminal creation to the right
      local Terminal = require('toggleterm.terminal').Terminal

      function _new_terminal_right()
        local terminals = require("toggleterm.terminal").get_all()
        local count = #terminals + 1
        local term = Terminal:new({
          count = count,
          direction = "horizontal"
        })
        term:toggle()
      end

      function _G.set_terminal_keymaps()
        local opts = {buffer = true, noremap = true, silent = true}

        -- Map terminal navigation
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)

        -- Map creating a terminal in a new split
        vim.keymap.set('n', '<leader>tn', '<cmd>lua _new_terminal_right()<CR>', {
          noremap = true,
          silent = true,
          buffer = true,
          desc = "New Terminal Right"
        })

        -- Map closing the current terminal
        vim.keymap.set('n', '<leader>tq', '<cmd>:q<CR>', {
          noremap = true,
          silent = true,
          buffer = true,
          desc = "Exit Terminal"
        })
      end

      -- This autocmd ensures the mappings are set when a terminal buffer is created
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end
  }
