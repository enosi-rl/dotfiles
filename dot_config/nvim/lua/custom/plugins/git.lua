return {
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
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

  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      'nvim-telescope/telescope.nvim', -- optional
    },
    opts = {},
    -- Configure neogit
    config = function()
      local neogit = require 'neogit'
      neogit.setup {}

      vim.keymap.set('n', '<leader>gs', neogit.open, {
        desc = 'Neogit [s]tart',
        silent = true,
        noremap = true,
      })
      vim.keymap.set('n', '<leader>gC', ':Neogit commit<CR>', {
        desc = 'Neogit [C]commit',
        silent = true,
        noremap = true,
      })
      vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', {
        desc = 'Neogit [p]ull',
        silent = true,
        noremap = true,
      })
      vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', {
        desc = 'Neogit [P]ush',
        silent = true,
        noremap = true,
      })
      vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>', {
        desc = 'Neogit [b]ranches',
        silent = true,
        noremap = true,
      })
      vim.keymap.set('n', '<leader>gl', "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", {
        desc = 'git worktree [l]ist',
      })
      vim.keymap.set('n', '<leader>gA', "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", {
        desc = 'git worktree [A]dd',
      })
      --vim.keymap.set('n', '<leader>gB', ':G blame<CR>', {
      --  desc = 'Neogit [B]lame',
      --  silent = true,
      --  noremap = true,
      --})
    end,
  },

  {
    'ThePrimeagen/git-worktree.nvim',
  },
}
