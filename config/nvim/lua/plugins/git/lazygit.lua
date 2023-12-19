-- Git操作
-- brewでlazygitを事前にインストールしておく
return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
  },
  keys = {
    {'<leader>gg', ':LazyGit<CR>', silent=true},
    {'<Esc>', 'q', ft='lazygit'},
  },
  config = function ()
    vim.g['lazygit_floating_window_use_plenary'] = 1
    require("telescope").load_extension("lazygit")
  end
}
