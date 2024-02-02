-- リンクをブラウザで開く
return {
	"tyru/open-browser.vim",
	keys = {
		{ "gx", "<Plug>(openbrowser-smart-search)" },
	},
	config = function()
		vim.g["netrw_nogx = 1"] = 1
	end,
}
