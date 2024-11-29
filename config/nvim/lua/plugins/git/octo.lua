-- PRやIssueの作成を行うためのプラグイン
return {
	"pwntester/octo.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
    -- optionを設定する
		require("octo").setup()
	end,
}
