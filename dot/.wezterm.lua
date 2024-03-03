local wezterm = require("wezterm")

-- フルスクリーンで起動
wezterm.on("gui-startup", function()
	local _, _, window = wezterm.mux.spawn_window({})
	window:gui_window():maximize()
end)

local config = {
	-- 画面サイズ
	initial_cols = 180,
	initial_rows = 50,
	quit_when_all_windows_are_closed = false,
	window_decorations = "TITLE | RESIZE | MACOS_FORCE_ENABLE_SHADOW",
	hide_tab_bar_if_only_one_tab = true,
	-- 描画周り
	window_padding = {
		left = 5,
		right = 5,
		top = 0,
		bottom = 0,
	},
	window_background_image = "/Users/sisi0808/Pictures/WallPaper/p1.jpg",
	window_background_image_hsb = {
		-- Darken the background image by reducing it to 1/3rd
		brightness = 0.045,
		hue = 1.0,
		saturation = 1.0,
	},
	-- window_background_opacity = 0.9,
	macos_window_background_blur = 9,
	-- フォント
	-- font = wezterm.font("Monoid Nerd Font Mono"),
  font = wezterm.font("HackGen Console NFJ"),
	font_size = 20,
  -- under cursor表示用の設定
  -- term = "wezterm",
	-- カラースキームの設定
	color_scheme = "Gruvbox dark, soft (base16)",
	-- ショートカットキー設定
	keys = {
		-- CMD+Ctl+Fでフルスクリーン切り替え
		{
			key = "f",
			mods = "CMD|CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
	},
  -- デフォルトのIME を無効にする
  -- macos_forward_to_ime_modifier_mask = "SHIFT|CTRL",
  -- デフォルトのシェルをfishにする
  -- default_prog = { '/opt/homebrew/bin/fish', '-l' }
}

return config
