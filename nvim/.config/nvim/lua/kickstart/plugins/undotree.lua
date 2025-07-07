return {
  'mbbill/undotree',
  keys = {
    { '<leader>ut', vim.cmd.UndotreeToggle, desc = 'Toggle Undotree' },
  },
  init = function()
    local undodir = vim.fn.stdpath 'cache' .. '/undo'
    if vim.fn.isdirectory(undodir) == 0 then
      vim.fn.mkdir(undodir, 'p')
    end
    vim.o.undodir = undodir
    vim.o.undofile = true
  end,
}
