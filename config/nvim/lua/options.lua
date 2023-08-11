-- options
vim.opt.relativenumber = true -- 行番号の表示
vim.opt.list = true -- タブ、空白、改行を可視化
vim.opt.title = true -- 編集中ファイル名の表示
vim.opt.laststatus = 2 -- ステータスを表示
vim.opt.ruler = true -- カーソル位置を表示
vim.opt.ambiwidth = "double" -- ○や□などの文字が重ならないようにする

vim.opt.backspace = "indent,eol,start" -- バックスペースでの行移動を可能にする
vim.opt.virtualedit = "onemore" -- カーソルを行末の一つ先まで移動可能にする
vim.opt.ignorecase = true -- 大文字、小文字の区別をしない
vim.opt.smartcase = true -- 大文字が含まれている場合は区別する
vim.opt.wrapscan = true -- 検索時に最後まで行ったら最初に戻る
vim.opt.incsearch = true -- インクリメンタルサーチを有効にする
vim.opt.hlsearch = true -- 検索した文字を強調
vim.opt.history = 1000 -- 履歴を1000件保存

vim.opt.expandtab = true -- タブをスペースに変換する
vim.opt.autoindent = true -- 自動インデント
vim.opt.smartindent = true -- オートインデント
vim.opt.tabstop = 2 -- タブをスペース2つ分に設定
vim.opt.shiftwidth = 2 -- インテンドをスペース二つ分に

vim.opt.clipboard:append("unnamed") -- コピーしたときはクリップボードを使用
vim.opt.backup = false -- バックアップファイルを作らない
vim.opt.swapfile = false -- スワップファイルを作らない
vim.opt.autoread = true -- 編集中のファイルが変更されたら、自動的に読み込み直す

vim.opt.encoding = "utf8" -- エンコーディングの設定
vim.opt.wildmenu = true -- 補完の強化
vim.opt.undofile = false -- Undoの永続化
vim.cmd("syntax enable") -- シンタックスをオン
vim.opt.helplang = 'ja', 'en' -- ヘルプを日本語で

-- digraph setting
-- 12354 => "あ"
-- vim.digraph.aa = 12354
-- vim.digraph.ii = 12356
-- vim.digraph.uu = 12358
-- vim.digraph.ee = 12360
-- vim.digraph.oo = 12362

-- -- 12450 => "ア"
-- vim.digraph.Aa = 12450
-- vim.digraph.Ii = 12452
-- vim.digraph.Uu = 12454
-- vim.digraph.Ee = 12456
-- vim.digraph.Oo = 12458

-- -- ん、ン
-- vim.digraph.nn = 12435
-- vim.digraph.Nn = 12531

-- -- カッコ
-- vim.digraph.j( = 65288 -- （
-- vim.digraph.j) = 65289 -- ）
-- vim.digraph.j[ = 12300 -- 「
-- vim.digraph.j] = 12301 -- 」
-- vim.digraph.j{ = 12302 -- 『
-- vim.digraph.j} = 12303 -- 』
-- vim.digraph.j< = 12304 -- 【
-- vim.digraph.j> = 12305 -- 】

-- -- 句読点
-- vim.digraph.j, = 65292 - ，
-- vim.digraph.j. = 65294 - ．
-- vim.digraph.j! = 65281 - ！
-- vim.digraph.j? = 65311 - ？
-- vim.digraph.j: = 65306 - ：

-- vim.digraph.jj = 106
