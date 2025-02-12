-- Editor enhancements (file navigation, search, etc.)

return {
  {
    -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        extensions = {
          ['ui-select'] = { require('telescope.themes').get_dropdown() },
        },
      })

      -- Load extensions
      pcall(telescope.load_extension, 'fzf')
      pcall(telescope.load_extension, 'ui-select')

      -- Keymaps
      local builtin = require('telescope.builtin')
      local keymap = vim.keymap.set
      keymap('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      keymap('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      keymap('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      keymap('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      keymap('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      keymap('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      keymap('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      keymap('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      keymap('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files' })
      keymap('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Advanced search configurations
      keymap('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
          winblend = 0,
          previewer = false,
        }))
      end, { desc = '[/] Fuzzily search in current buffer' })

      keymap('n', '<leader>s/', function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        })
      end, { desc = '[S]earch [/] in Open Files' })

      keymap('n', '<leader>sn', function()
        builtin.find_files({ cwd = vim.fn.stdpath('config') })
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Git diff viewer
  { 'sindrets/diffview.nvim' },
}
