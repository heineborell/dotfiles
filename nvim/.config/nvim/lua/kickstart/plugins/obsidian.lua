return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = 'stuffvault',
        path = '$HOME/library/Mobile Documents/iCloud~md~obsidian/Documents/stuffvault',
      },
    },
    notes_subdir = 'inbox',
    new_notes_location = 'notes_subdir',

    disable_frontmatter = true,
    templates = {
      subdir = 'templates',
      date_format = '%y-%m-%d',
      time_format = '%h:%m:%s',
    },
    -- see below for full list of options 👇
    -- key mappings, below are the defaults
    mappings = {
      -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- toggle check-boxes
      ['<leader>ti'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
  },
}
