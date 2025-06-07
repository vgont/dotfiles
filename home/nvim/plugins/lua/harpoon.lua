local harpoon = require("harpoon")
harpoon:setup()

vim.g.maplocalleader = " "
vim.g.mapleader = " "

for i = 1, 9 do
  vim.keymap.set('n', '<leader>h' .. i, function()
    harpoon:list():select(i)
    print('harpoon: selected ' .. i)
  end, { desc = 'harpoon: select ' .. i })
end

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
