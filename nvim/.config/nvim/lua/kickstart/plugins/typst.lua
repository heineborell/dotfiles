return {
  'chomosuke/typst-preview.nvim',
  lazy = false, -- or ft = 'typst'
  version = '1.*',
  opts = {
    open_cmd = 'zathura %s',
  }, -- lazy.nvim will implicitly calls `setup {}`
}
