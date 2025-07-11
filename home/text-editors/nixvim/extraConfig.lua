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

vim.notify = require('mini.notify').make_notify()

-- Hightlight
vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, 'YankHighlight', { bg = "#83a598" })

-- Yank Hightlight
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'YankHighlight', timeout = 150 }
  end,
})

-- Insane Keymaps
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>')
vim.keymap.set('n', '<leader>O', 'mzO<Esc>`z<cmd>delm z<CR>', { desc = "Add blank line above" })
vim.keymap.set('n', '<leader>o', 'mzo<Esc>`z<cmd>delm z<CR>', { desc = "Add blank line below" })
vim.keymap.set('x', '<leader>y', 'mzy`z<cmd>delm z<CR>', { desc = "Yank and preserve cursor location" })
