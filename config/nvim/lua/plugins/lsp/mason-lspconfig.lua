-- lspとmassonを紐付ける
return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	-- event = 'InsertEnter',
	dependencies = {
		-- lspの設定集
		"neovim/nvim-lspconfig",
		-- lsp用のインストールマネージャー
		"williamboman/mason.nvim",
		-- efm用の設定集
		-- "creativenull/efmls-configs-nvim",
		-- formatterの設定
		"stevearc/conform.nvim",
		-- linterの設定
		"mfussenegger/nvim-lint",
	},
	keys = {
		{ "<leader>l", ":Mason<CR>", silent = true },
	},
}
