-- ファイラー
return {
	"lambdalisue/fern.vim",
	-- lazy=false,
	dependencies = {
		-- アイコン類
		{ "lambdalisue/nerdfont.vim" },
		{
			"lambdalisue/fern-renderer-nerdfont.vim",
			ft = "fern",
			config = function()
				vim.g["fern#renderer"] = "nerdfont"
			end,
		},
		-- アイコン類
		{
			"lambdalisue/glyph-palette.vim",
			ft = "fern",
			config = function()
				vim.fn["glyph_palette#apply"]()
			end,
		},
		-- fernをデフォルトのエクスプローラーに
		{
			"lambdalisue/fern-hijack.vim",
			config = function()
				vim.api.nvim_set_var("loaded_netrwPlugin", 1)
			end,
		},
		-- ファイルのプレビュー
		{
			"yuki-yano/fern-preview.vim",
			keys = {
				{ "p", "<Plug>(fern-action-preview:toggle)", ft = "fern" },
				{ "<C-p>", "<Plug>(fern-action-preview:auto:toggle)", ft = "fern" },
				{ "<C-d>", "<Plug>(fern-action-preview:scroll:down:half)", ft = "fern" },
				{ "<C-u>", "<Plug>(fern-action-preview:scroll:up:half)", ft = "fern" },
			},
		},
	},
	keys = {
		-- open as side bar
		{ "<F2>", ":Fern . -reveal=% -drawer -toggle<CR>", silent = true },
		{ "<F3>", ":Fern . -reveal=% -drawer -toggle<CR>", silent = true },
		{ "sa", "<Plug>(fern-action-open:select)", ft = "fern" },
		{ "ss", "<Plug>(fern-action-open:split)", ft = "fern" },
		{ "sd", "<Plug>(fern-action-open:vsplit)", ft = "fern" },
	},
}
