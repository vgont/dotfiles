local harpoon = require("harpoon")
harpoon:setup()

vim.g.maplocalleader = " "
vim.g.mapleader = " "

for i = 1, 9 do
  local keys = {'w', 'f', 'p', 'r', 's', 't', 'x', 'c', 'd'}

  vim.keymap.set('n', '<leader>h' .. keys[i], function()
    harpoon:list():select(i)
    print('harpoon: selected ' .. i)
  end, { desc = 'harpoon: select ' .. i })
end

local toggle_opts = {
  border = "rounded",
  title_pos = "center",
  title = " Harpoon ",
}

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts) end)
