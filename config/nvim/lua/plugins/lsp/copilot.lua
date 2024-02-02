-- copilot
return {
	"zbirenbaum/copilot.lua",
	-- dependencies = { "gptlang/CopilotChat.nvim" },
	cmd = "Copilot",
	event = "InsertEnter",
	lazy = false,
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<C-l>",
					accept_word = false,
					accept_line = false,
					-- next = "<C-o>",
					-- prev = "<C-i>",
					dismiss = "<C-]>",
				},
			},
		})
	end,
}
