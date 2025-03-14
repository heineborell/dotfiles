return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    lazygit = { enabled = true },
    terminal = { enabled = true },
    image = {
      enabled = true,
      doc = {
        inline = false,
        -- render the image in a floating window
        -- only used if `opts.inline` is disabled
        float = true,
        max_width = 20,
        max_height = 10,
      },
    },
    --bigfile = { enabled = true },
    dashboard = { enabled = true },
    --explorer = { enabled = true },
    --indent = { enabled = true },
    --input = { enabled = true },
    ---picker = { enabled = true },
    --notifier = { enabled = true },
    --quickfile = { enabled = true },
    --scope = { enabled = true },
    --scroll = { enabled = true },
    --statuscolumn = { enabled = true },
    --words = { enabled = true },
  },
  keys = {
    {
      '<leader>lg',
      function()
        require('snacks').lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>gl',
      function()
        require('snacks').lazygit.log()
      end,
      desc = 'Lazygit Logs',
    },
    {
      '<c-/>',
      function()
        require('snacks').terminal()
      end,
      desc = 'Toggle Terminal',
    },
    {
      '<c-_>',
      function()
        require('snacks').terminal()
      end,
      desc = 'which_key_ignore',
    },
  },
}
