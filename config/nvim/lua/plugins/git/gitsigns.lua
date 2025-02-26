-- Gitの差分表示
return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
		})
	end,
	keys = {
		{ "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "GitFileDiff", silent = true },
		{ "<leader>gb", "<cmd>Gitsigns blame<cr>", desc = "GitBlame", silent = true },
		{ "<leader>gq", "<cmd>Gitsigns setloclist<cr>", desc = "GitDiffQf", silent = true },
		{ "<leader>gd", "<cmd>Gitsigns toggle_deleted<cr>", desc = "GitDelete", silent = true },
		{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "GitStageHunk", silent = true },
		{ "<leader>gS", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "GitUnStageHunk", silent = true },
	},
}
