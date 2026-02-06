return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    ft = { 'markdown' }, -- lazy load only for markdown files
    opts = {
      -- Render in normal mode (not just when viewing, also when editing)
      render_modes = { 'n', 'c' },
      -- Heading configuration
      heading = {
        enabled = true,
        sign = true,
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      },
      -- Code block configuration
      code = {
        enabled = true,
        sign = true,
        style = 'full',
        border = 'thin',
      },
      -- Bullet points
      bullet = {
        enabled = true,
        icons = { '●', '○', '◆', '◇' },
      },
      -- Checkboxes
      checkbox = {
        enabled = true,
        unchecked = { icon = '󰄱 ' },
        checked = { icon = '󰱒 ' },
      },
    },
  },
}

