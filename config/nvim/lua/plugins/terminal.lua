-- floating terminal
return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {--[[ things you want to change go here]]},
  keys ={
    {'<C-t>', ':ToggleTerm size=40 direction=float <CR>', mode='n'},
    {'<C-t>', '<C-d>', mode='t'},
    -- {'<leader>tn', ':FloatermNew<CR>'},
    -- {'<leader>tc', ':FloatermKill<CR>'},
    -- {'<leader>to', ':FloatermOnly<CR>'},
    -- {'<leader>th', ':FloatermPrev<CR>'},
    -- {'<leader>tl', ':FloatermNext<CR>'},
  }
}
