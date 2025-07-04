-- vim.cmd [[
--   highlight Normal guibg=none
--   highlight NonText guibg=none
--   highlight Normal ctermbg=none
--   highlight NonText ctermbg=none
--
--   highlight Pmenu guibg=none ctermbg=none
--   highlight PmenuSel guibg=none ctermbg=none
--   highlight FloatBorder guibg=none ctermbg=none
--   highlight NormalFloat guibg=none ctermbg=none
-- ]]

vim.api.nvim_set_hl(0, 'Normal', { bg = "none" })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "none" })

-- Yank Hightlight
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 150 }
  end,
})

