return {

  -- NOTE: Plugins can also be configured to run lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>f', group = '[F]iles' },
        { '<leader>g', group = '[G]it' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]rouble' },
        { '<leader>w', group = '[W]orkspace' },
      }
    end,
  },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    config = function() -- This is the function that runs, AFTER loading
      require('noice').setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
  },

  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    config = function()
      require('trouble').setup {}
      vim.keymap.set('n', '<leader>tx', '<cmd>Trouble diagnostics toggle<cr>', { silent = true, noremap = true, desc = 'Trouble toggle' })
      vim.keymap.set('n', '<leader>tw', '<cmd>Trouble diagnostics toggle<cr>', { silent = true, noremap = true, desc = 'Trouble workspace diagnostics' })
      vim.keymap.set('n', '<leader>td', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { silent = true, noremap = true, desc = 'Trouble document diagnostics' })
      vim.keymap.set('n', '<leader>tl', '<cmd>Trouble loclist toggle<cr>', { silent = true, noremap = true, desc = 'Trouble loclist' })
      vim.keymap.set('n', '<leader>tq', '<cmd>Trouble qflist toggle<cr>', { silent = true, noremap = true, desc = 'Trouble quickfix' })
      vim.keymap.set('n', 'gR', '<cmd>Trouble lsp_references toggle<cr>', { silent = true, noremap = true, desc = 'Trouble LSP references' })
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
