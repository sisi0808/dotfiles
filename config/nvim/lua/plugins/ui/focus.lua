-- カーソルが当たっているウィンドウサイズを大きくする
return {
	"nvim-focus/focus.nvim",
	config = function()
		require("focus").setup()
	end,
}
