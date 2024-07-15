-- Vimのmarkの機能を拡張するプラグイン
return {
	"chentoast/marks.nvim",

	lazy = false,

	config = function()
		require("marks").setup()
	end,

	keys = {
		{ "<leader>mm", ":MarksListBuf<CR>", desc = "BufList", silent = true },
		{ "<leader>mM", ":MarksListAll<CR>", desc = "AllList", silent = true },
		{ "<leader>mb0", ":BookmarksList 0<CR>", desc = ")bookMark", silent = true },
    { "<leader>mb1", ":BookmarksList 1<CR>", desc = "!bookMark", silent = true },
    { "<leader>mb2", ":BookmarksList 2<CR>", desc = "@bookMark", silent = true },
    { "<leader>mb3", ":BookmarksList 3<CR>", desc = "#bookMark", silent = true },
    { "<leader>mb4", ":BookmarksList 4<CR>", desc = "$bookMark", silent = true },
    { "<leader>mb5", ":BookmarksList 5<CR>", desc = "%bookMark", silent = true },
    { "<leader>mb6", ":BookmarksList 6<CR>", desc = "^bookMark", silent = true },
    { "<leader>mb7", ":BookmarksList 7<CR>", desc = "&bookMark", silent = true },
    { "<leader>mb8", ":BookmarksList 8<CR>", desc = "*bookMark", silent = true },
    { "<leader>mb9", ":BookmarksList 9<CR>", desc = "(bookMark", silent = true },
	},
}
