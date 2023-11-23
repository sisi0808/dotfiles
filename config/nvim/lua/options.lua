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
opt.relativenumber = true
-- opt.number = true
opt.list = true
opt.listchars = { tab = '>>', trail = '-', nbsp = '+' }
opt.title = true
opt.laststatus = 3
opt.ruler = true
-- opt.ambiwidth = "double"
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

opt.splitbelow = true
opt.splitright = true

-- digraph setting
cmd [[
  " 12354 => "あ"
  digraph aa 12354
  digraph ii 12356
  digraph uu 12358
  digraph ee 12360
  digraph oo 12362

  " 12450 => "ア"
  digraph Aa 12450
  digraph Ii 12452
  digraph Uu 12454
  digraph Ee 12456
  digraph Oo 12458

  " ん、ン
  digraph nn 12435
  digraph Nn 12531

  " カッコ
  digraphs j( 65288  " （
  digraphs j) 65289  " ）
  digraphs j[ 12300  " 「
  digraphs j] 12301  " 」
  digraphs j{ 12302  " 『
  digraphs j} 12303  " 』
  digraphs j< 12304  " 【
  digraphs j> 12305  " 】

  " 句読点
  digraphs j, 65292  " ，
  digraphs j. 65294  " ．
  digraphs j! 65281  " ！
  digraphs j? 65311  " ？
  digraphs j: 65306  " ：

  digraphs jj 106  " j
]]
