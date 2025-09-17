-- lua/colors/learncpp.lua
local M = {}

local colors = {
  bg = '#181a1b',
  fg = '#ffffff',
  green = '#71fc89',
  blue = '#4fa8ff',
  sand = '#dfbc86',
  red = '#ff3319',
  purple = '#c545f7',
  cyan = '#94e2d5',
  grey = '#c6c1b9',
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.colorscheme()
  vim.cmd 'highlight clear'
  vim.cmd 'syntax reset'

  vim.o.background = 'dark'
  vim.g.colors_name = 'learncpp'

  -- Base UI
  hi('Normal', { bg = colors.bg, fg = colors.fg })
  hi('Comment', { fg = colors.green, italic = true })
  hi('String', { fg = colors.red })
  hi('Function', { fg = colors.sand })
  hi('Type', { fg = colors.blue })
  hi('Statement', { fg = colors.purple })
  hi('Constant', { fg = colors.fg })
  hi('Variable', { fg = colors.fg })
  hi('Special', { fg = colors.blue })

  ------------------------------------------------------------------
  -- Treesitter groups (linked to legacy for consistency)
  ------------------------------------------------------------------
  -- Types
  hi('@type', { link = 'Type' })
  hi('@type.builtin', { link = 'Type' })
  hi('@type.python', { fg = colors.fg })
  hi('@type.definition', { link = 'Type' })
  hi('@type.qualifier', { link = 'Type' }) -- e.g., const, volatile
  hi('@type.cpp', { fg = colors.fg })
  --- Module
  hi('@lsp.type.namespace.cpp', { fg = colors.fg })
  hi('@lsp.type.class.cpp', { fg = colors.fg })
  hi('@module.cpp', { fg = colors.fg })

  -- Functions
  hi('@function', { link = 'Function' })
  hi('@function.call', { link = 'Function' })
  hi('@function.builtin', { link = 'Function' })
  hi('@constructor', { link = 'Function' })

  -- Keywords / Statements
  hi('@keyword.cpp', { link = 'Type' })
  hi('@keyword.type.cpp', { link = 'Type' })
  hi('@keyword.modifier', { link = 'Type' })
  hi('@keyword.import.cpp', { fg = colors.grey })
  hi('@keyword.import.python', { fg = colors.grey })
  hi('@keyword.directive.cpp', { fg = colors.grey })
  hi('@keyword.directive.define.cpp', { fg = colors.grey })
  hi('@keyword.return', { link = 'Statement' })
  hi('@keyword.operator', { link = 'Statement' })
  hi('@conditional', { link = 'Statement' }) -- if, else
  hi('@repeat', { link = 'Statement' }) -- for, while

  -- Literals
  hi('@string', { link = 'String' })
  hi('@string.escape', { link = 'String' })
  hi('@character', { link = 'String' })
  hi('@number', { fg = colors.fg })
  hi('@boolean', { fg = colors.blue })
  hi('@constant', { link = 'Constant' })

  -- Operators / punctuation
  hi('@operator', { fg = colors.fg })
  hi('@punctuation', { fg = colors.fg })
end

return M
