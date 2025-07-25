return {
  'askfiy/smart-translate.nvim',
  cmd = { 'Translate' },
  dependencies = { 'askfiy/http.nvim' },
  config = function()
    require('smart-translate').setup {
      default = {
        cmds = {
          source = 'auto',
          target = 'en',
          handle = 'float',
          engine = 'google',
        },
        cache = true,
      },
    }
  end,
}
