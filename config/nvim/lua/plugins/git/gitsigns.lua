-- Gitの差分表示
return {
	"lewis6991/gitsigns.nvim",
  lazy=false,
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
		})
	end,
  keys = {
    { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "GitFileDiff", silent = true },
  }
}
