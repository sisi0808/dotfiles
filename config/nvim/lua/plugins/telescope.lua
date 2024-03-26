-- Fuzzy finder
return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- 最近使用したファイルを検索
		{
			"nvim-telescope/telescope-frecency.nvim",
			config = function()
				require("telescope").load_extension("frecency")
			end,
			dependencies = "kkharji/sqlite.lua",
		},
		-- icon
		"nvim-tree/nvim-web-devicons",
		-- live-grepでオプションを指定できるよう
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			config = function()
				require("telescope").load_extension("live_grep_args")
			end,
		},
		-- -- kensakuとの連携
		-- {
		-- 	"Allianaab2m/telescope-kensaku.nvim",
		-- 	config = function()
		-- 		require("telescope").load_extension("kensaku")
		-- 	end,
		-- },
		-- プロジェクトごとのファイル検索
		{
			"nvim-telescope/telescope-project.nvim",
			config = function()
				require("telescope").load_extension("project")
			end,
		},
		{
			"nvim-telescope/telescope-media-files.nvim",
			dependencies = {
				"nvim-lua/popup.nvim",
			},
			config = function()
				require("telescope").load_extension("media_files")
				require("telescope").setup({
					extensions = { media_files = { find_cmd = "rg" } },
				})
			end,
		},
	},
	keys = {
		{
			"<leader><leader>",
			":Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>",
			desc = "File",
			silent = true,
		},
		{ "<leader>ff", ":Telescope frecency<CR>", desc = "Recent", silent = true },
		{ "<leader>fg", ":Telescope live_grep_args<CR>", desc = "Text", silent = true },
		{ "<leader>fh", ":Telescope help_tags<CR>", desc = "Help tag", silent = true },
		{ "<leader>fc", ":Telescope command_history<CR>", desc = "Command", silent = true },
		{ "<leader>fk", ":Telescope keymaps<CR>", desc = "Keymaps", silent = true },
		{ "<leader>fb", ":Telescope buffers<CR>", desc = "Buffer", silent = true },
		{ "<leader>fp", ":Telescope project<CR>", desc = "Project", silent = true },
    { "<leader>fi", ":Telescope media_files<CR>", desc = "image", silent = true },

    { "<leader>fgs", ":Telescope git_status<CR>", desc = "Git Status", silent = true },
    { "<leader>fgb", ":Telescope git_bcommits<CR>", desc = "Git BCommit", silent = true },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = { -- extend mappings
					i = {
						["<c-a>"] = { "<home>", type = "command" },
						["<c-e>"] = { "<end>", type = "command" },
            ["<c-p>"] = "cycle_history_prev",
            ["<c-n>"] = "cycle_history_next",
					},
				},
			},
		})
	end,
}
