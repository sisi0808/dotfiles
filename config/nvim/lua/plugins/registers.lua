-- Registerを拡張
return {
	"tversteeg/registers.nvim",
	config = function()
		require("registers").setup()
	end,
}
