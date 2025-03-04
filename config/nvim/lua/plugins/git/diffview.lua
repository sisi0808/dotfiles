-- Gitの差分表示
return {
	"sindrets/diffview.nvim",
	lazy = false,
	config = function()
		require("diffview").setup({
			keymaps = {
				file_panel = {
					{ "n", "ss", require("diffview.actions").goto_file_split, desc = "Open the file in a new split" },
				},
			},
		})
	end,
	keys = {
		{ "<leader>gp", ":DiffviewOpen develop<CR>", desc = "Git PR review with develop", silent = true },
		{ "<leader>gh", ":DiffviewFileHistory %<CR>", desc = "Git file history", silent = true },
		{ "<leader>ge", ":DiffviewFiletoggleFiles<CR>", desc = "Git toggle files", silent = true },
	},
}
