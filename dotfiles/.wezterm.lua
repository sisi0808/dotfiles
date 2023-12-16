local wezterm = require('wezterm')

local config = {
  -- 画面サイズ
  initial_cols = 180,
  initial_rows = 50,
  quit_when_all_windows_are_closed = false,
  window_decorations = 'TITLE | RESIZE | MACOS_FORCE_ENABLE_SHADOW',
  hide_tab_bar_if_only_one_tab = true,
  -- 描画周り
  window_background_opacity = 0.7,
  macos_window_background_blur = 9,
  window_padding = {
    left = 5,
    right = 5,
    top = 0,
    bottom = 0,
  },
  -- フォント
  font = wezterm.font('Monoid Nerd Font Mono'),
  font_size = 20,
  -- カラースキームの設定
  color_scheme = 'Gruvbox dark, soft (base16)',
}


return config
