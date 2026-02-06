return {
  { 'mfussenegger/nvim-dap', event = 'VimEnter' },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    event = 'VimEnter',
    config = function()
      require('dapui').setup()
    end,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    event = 'VimEnter',
    config = function()
      require('nvim-dap-virtual-text').setup {}
    end,
  },
}
