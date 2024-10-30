-- Obsidianっぽいのを使えるように
return {
	"epwalsh/obsidian.nvim",
	ft = "markdown",
	-- lazy = completioncompletioncompletionfalse,
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		"BufReadPre "
			.. vim.fn.expand("~")
			.. "/Documents/Obsidian/**.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/Documents/Obsidian/**.md",
		-- "BufReadPre path/to/my-vault/**.md",
		-- "BufNewFile path/to/my-vault/**.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		notes_subdir = "Files",
    new_notes_location = "notes_subdir",
		workspaces = {
			{
				name = "default",
				path = "~/Documents/Obsidian",
			},
		},
		daily_notes = {
			folder = "Daily",
			date_format = "%Y-%m-%d, %a",
			template = "Template/DailyNote.md",
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
			-- new_notes_location = "notes_subdir",
			-- use_path_only = true,
		},
		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Toggle check-boxes.
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			-- Smart action depending on context, either follow link or toggle checkbox.
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
		templates = {
			subdir = "Template",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			-- A map for custom variables, the key should be the variable and the value a function
			substitutions = {},
		},
		use_advanced_uri = true,
		-- Specify how to handle attachments.
		attachments = {
			img_folder = "Public", -- This is the default
		},
	},
}
