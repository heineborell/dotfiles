-- Custom plugin for Markdown settings
return {
  'nvim-lua/plenary.nvim', -- Placeholder plugin, you can use any plugin you prefer
  ft = 'markdown', -- Load only for markdown files
  config = function()
    -- Explicitly create the autocommand for markdown files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        -- Apply settings for markdown files
        vim.opt_local.wrap = true
        vim.opt_local.breakindent = true
        vim.opt_local.linebreak = true
        vim.opt_local.spell = true
        vim.opt_local.spelllang = 'en_us'

        -- Better navigation in wrapped lines
        vim.keymap.set('n', 'j', 'gj', { buffer = true })
        vim.keymap.set('n', 'k', 'gk', { buffer = true })
      end,
    })
  end,
}
