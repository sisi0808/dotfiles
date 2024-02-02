-- 文字コード
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- タブ、インテンド
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- 表示、見た目
-- vim.opt.relativenumber = true
-- vim.opt.number = true
vim.opt.list = true
vim.opt.listchars = { tab = ">>", trail = "-", nbsp = "+" }
vim.opt.title = true
vim.opt.laststatus = 3
vim.opt.ruler = true
-- vim.opt.ambiwidth = "double"
vim.opt.ambiwidth = "single"
vim.cmd("syntax enable")
vim.opt.updatetime = 250

-- カーソルを常に中央に表示
vim.opt.so = 999
-- vim.opt.so = 0

-- 行末への移動
vim.opt.backspace = "indent,eol,start"
vim.opt.virtualedit = "onemore"

-- 検索
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- バックアップ、スワップ
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true

-- 履歴
vim.opt.history = 1000
vim.opt.clipboard:append("unnamed")

-- フォント
vim.opt.guifont = "HackGenNerd-Regular:h12"
vim.opt.termguicolors = true

-- ヘルプを日本語で
vim.opt.helplang = "ja"

-- ウィンドウ分割方向の制御
vim.opt.splitbelow = true
vim.opt.splitright = true

-- leaderキーをspaceキーに設定
vim.g.mapleader = " "

-- digraph setting
vim.fn.digraph_setlist({
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
	{ "jj", "j" },
})

vim.opt.matchpairs:append({
	"（:）",
	"「:」",
	"『:』",
	"【:】",
})
