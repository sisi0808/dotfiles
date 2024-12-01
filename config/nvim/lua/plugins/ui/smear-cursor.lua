-- カーソル移動のUIを表示
return {
	"sphamba/smear-cursor.nvim",
	opts = { -- Default  Range
		stiffness = 0.5, -- 0.6      [0, 1]
		trailing_stiffness = 0.5, -- 0.3      [0, 1]
		trailing_exponent = 0.1, -- 0.1      >= 0
		distance_stop_animating = 0.1, -- 0.1      > 0
		hide_target_hack = false, -- true     boolean
	},
}
