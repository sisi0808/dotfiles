-- Error listを表示
-- 複数ファイル間の警告も出してくれる
return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		-- { "<leader>tt", ":TroubleToggle<CR>", desc = "Trouble Toggle", silent = true },
		-- { "<leader>tr", ":TroubleReflesh<CR>", desc = "Trouble Reflesh", silent = true },
    {"<leader>xx", function() require("trouble").toggle() end, desc = "Trouble Toggle", silent = true },
    {"<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, desc = "Trouble Workspace", silent = true },
    {"<leader>xd", function() require("trouble").toggle("document_diagnostics") end, desc = "Trouble document", silent = true },
    {"<leader>xq", function() require("trouble").toggle("quickfix") end, desc = "Trouble quickfix", silent = true },
    {"<leader>xl", function() require("trouble").toggle("loclist") end, desc = "Trouble loclist", silent = true },
	},
}
