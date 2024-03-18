return {
  { 'mfussenegger/nvim-dap', event = 'VimEnter' },
  { 'rcarriga/nvim-dap-ui', event = 'VimEnter' },
  {
    'theHamsta/nvim-dap-virtual-text',
    event = 'VimEnter',
    config = function()
      require('nvim-dap-virtual-text').setup {}
    end,
  },
}
