-- 文字コード
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- タブ、インテンド
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2

-- 表示、見た目
-- opt.relativenumber = true
-- opt.number = true
opt.list = true
opt.listchars = { tab = '>>', trail = '-', nbsp = '+' }
opt.title = true
opt.laststatus = 3
opt.ruler = true
-- opt.ambiwidth = "double"
opt.ambiwidth = "single"
cmd("syntax enable")
opt.updatetime = 250

-- カーソルを常に中央に表示
-- opt.so = 999
-- opt.so = 0

-- 行末への移動
opt.backspace = "indent,eol,start"
opt.virtualedit = "onemore"

-- 検索
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true
opt.incsearch = true
opt.hlsearch = true

-- バックアップ、スワップ
opt.backup = false
opt.swapfile = false
opt.autoread = true
opt.undodir = fn.stdpath('data') .. '/undo'
opt.undofile = true

-- 履歴
opt.history = 1000
opt.clipboard:append("unnamed")

-- フォント
opt.guifont = "HackGenNerd-Regular:h12"
opt.termguicolors = true

-- ヘルプを日本語で
opt.helplang = 'ja'

-- ウィンドウ分割方向の制御
opt.splitbelow = true
opt.splitright = true

-- leaderキーをspaceキーに設定
g.mapleader = " "

-- digraph setting
fn.digraph_setlist {
  { "aa", "あ" },
  { "ii", "い" },
  { "uu", "う" },
  { "ee", "え" },
  { "oo", "お" },

  { "Aa", "ア" },
  { "Ii", "イ" },
  { "Uu", "ウ" },
  { "Ee", "エ" },
  { "Oo", "オ" },

  { "nn", "ん" },
  { "Nn", "ン" },

  { "j(", "（" },
  { "j)", "）" },
  { "j[", "「" },
  { "j]", "」" },
  { "j{", "『" },
  { "j}", "』" },
  { "j<", "【" },
  { "j>", "】" },
  { "j,", "、" },
  { "j.", "。" },
  { "j!", "！" },
  { "j?", "？" },
  { "j:", "：" },
  { "jj", "j" }
}

opt.matchpairs:append{
  "（:）",
  "「:」",
  "『:』",
  "【:】",
}
