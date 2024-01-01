-- Error listを表示
-- 複数ファイル間の警告も出してくれる
return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
  keys = {
    {"<leader>tt", ":TroubleToggle<CR>", desc="Trouble Toggle", silent=true },
    {"<leader>tc", ":TroubleClose<CR>", desc="Trouble Close", silent=true },
  }
}
