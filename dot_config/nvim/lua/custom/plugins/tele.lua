return {

  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          border = true,
          style = 'bordered',
          -- borderchars = {
          --   prompt = { '─', ' ', ' ', ' ', '─', '─', ' ', ' ' },
          --   results = { ' ' },
          --   preview = { ' ' },
          -- },
          layout_strategy = 'vertical',
          layout_config = {
            -- preview_height = 0.7,
            vertical = {
              size = {
                width = '95%',
                height = '95%',
              },
            },
          },
          extensions = {
            ['ui-select'] = {
              require('telescope.themes').get_dropdown(),
            },
          },
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ['<C-j>'] = require('telescope.actions').move_selection_next,
              ['<C-k>'] = require('telescope.actions').move_selection_previous,
            },
          },
        },
      }

      -- ???require('telescope').load_extension 'harpoon'
      require('telescope').load_extension 'git_worktree'

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'

      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer]' })

      -- vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[ ] Find existing buffers' })
      -- vim.keymap.set('n', '<leader>sm', ':Telescope harpoon marks<CR>', { desc = 'Harpoon [M]arks' })

      vim.keymap.set('n', '<leader><leader>', function()
        require('telescope').extensions.smart_open.smart_open {
          cwd_only = true,
          filename_first = true,
        }
      end, { noremap = true, silent = true, desc = '[S]how Recent Files' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]how [b]uffers' })
      vim.keymap.set('n', '<leader>sC', builtin.git_commits, { desc = '[S]earch git [C]ommits' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [d]iagnostics' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [f]iles' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [g]rep' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [h]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [k]eymaps' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [r]esume' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [s]elect Telescope' })
      vim.keymap.set('n', '<leader>sS', builtin.git_status, { desc = '[S]earch git [S]tatus' })
      vim.keymap.set('n', '<leader>st', ':TodoTelescope<CR>', { desc = '[S]earch [t]odos' })
      vim.keymap.set('n', '<leader>sT', builtin.treesitter, { desc = '[S]earch [T]reesitter' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [w]ord' })

      -- vim.keymap.set('n', '<Leader>sn', "<CMD>lua require('telescope').extensions.notify.notify()<CR>", { desc = '' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
  {
    -- https://github.com/nvim-telescope/telescope-file-browser.nvim
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },

    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        extensions = {
          ['file_browser'] = {
            initial_mode = 'normal',
          },
        },
      }
      require('telescope').load_extension 'file_browser'
      vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>', { desc = '[f]ile [b]rowser' })
      -- open file_browser with the path of the current buffer
      vim.keymap.set('n', '<leader>fB', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = '[f]ile [B]rowser (current buffer)' })
    end,
  },
  -- https://github.com/danielfalk/smart-open.nvim
  {
    'danielfalk/smart-open.nvim',
    branch = '0.2.x',
    config = function()
      require('telescope').load_extension 'smart_open'
    end,
    dependencies = {
      'kkharji/sqlite.lua',
      -- Only required if using match_algorithm fzf
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { 'nvim-telescope/telescope-fzy-native.nvim' },
    },
  },
}
