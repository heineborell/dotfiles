return {

  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'skim'
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
  {
    'iurimateus/luasnip-latex-snippets.nvim',
    -- vimtex isn't required if using treesitter
    requires = { 'L3MON4D3/LuaSnip', 'lervag/vimtex' },
    config = function()
      require('luasnip-latex-snippets').setup { use_treesitter = false }
      require('luasnip').config.setup { enable_autosnippets = true }
    end,
  },
}
