-- Git差分のViewを提供
return {
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>dv", "<cmd>DiffviewOpen<cr>", desc = "GitDiffOpen", silent = true },
		{ "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "GitDiffClose", silent = true },
	},
}
