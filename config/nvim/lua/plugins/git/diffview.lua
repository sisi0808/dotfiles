-- Gitの差分表示
return {
	"sindrets/diffview.nvim",
	lazy = false,
	config = function()
		require("diffview").setup({})
	end,
  keys = {
    { "<leader>gp", ":DiffviewFileOpen develop", desc = "Git PR review with develop", silent = true },
    { "<leader>gh", ":DiffviewFileHistory %", desc = "Git file history", silent = true },
  },
}
