-- Pluginが関係無いKeymapを設定する

-- カーソル移動
nmap("<leader>4", "$")
nmap("<leader>5", "%")
nmap("<leader>6", "^")

-- ファイル保存・終了
nmap("<leader>w", ":w<CR>")
nmap("<leader>q", ":q<CR>")
nmap("<leader>wa", ":w<CR>")
nmap("<leader>qa", ":q<CR>")
nmap("<leader>qa", ":qa<CR>")
nmap("<leader>wq", ":wq<CR>")

-- ウインドウを閉じる(bufferは残る)
nmap("<leader>c", ":clo<CR>")

-- undoをremap
nmap("U", "<C-r>")

-- タブ設定
-- 新規タブをホームディレクトリで
-- nmap('<C-t>', ':tabe ~/<CR>')
-- 新規タブを同じディレクトリで
-- nmap('<C-t>', ':tabe .<CR>')
-- nmap('<C-p>', 'gt')
-- nmap('<C-n>', 'gT')

-- Terminalモード設定
-- tmap('<Esc>', '<C-\\><C-n>')
-- cmd('command! -nargs=* T split | wincmd j | resize 20 | terminal <args>')
-- nmap('<leader>t', ':T<CR>')

-- Vimの設定ファイルを編集
nmap("<leader>ww", ":source ~/.config/nvim/init.lua<CR>")
nmap("<leader>wr", ":new ~/.config/nvim/init.lua<CR>", { silent = true })

-- ウィンドウ操作
nmap("ss", ":split<CR>")
nmap("sv", ":vsplit<CR>")
nmap("s-", "<C-w>-")
nmap("s+", "<C-w>+")
nmap("s>", "<C-w>>")
nmap("s<", "<C-w><")
nmap("s=", "<C-w>=")

-- ウィンドウ移動
nmap("sh", "<C-w>h")
nmap("sj", "<C-w>j")
nmap("sk", "<C-w>k")
nmap("sl", "<C-w>l")

nmap("sH", "<C-w>H")
nmap("sJ", "<C-w>J")
nmap("sK", "<C-w>K")
nmap("sL", "<C-w>L")

-- Buffer操作
nmap("so", "<cmd>bnext<cr>")
nmap("si", "<cmd>bprevious<cr>")

-- QuickFix
nmap("]q", ":cnext<CR>")
nmap("[q", ":cprev<CR>")
nmap("<C-q>", ":call QuickFixToggle()<CR>")

-- インデントを揃えたペースト
nmap("p", "]p")
nmap("P", "]P")

-- 空行を挿入
nmap("<leader>o", "o<ESC>k")
nmap("<leader>O", "O<ESC>j")

-- Digraph設定
nmap("fj", "f<C-k>j")
nmap("Fj", "F<C-k>j")
nmap("tj", "t<C-k>j")
nmap("Tj", "T<C-k>j")

omap("fj", "f<C-k>j")
omap("Fj", "F<C-k>j")
omap("tj", "t<C-k>j")
omap("Tj", "T<C-k>j")

xmap("fj", "f<C-k>j")
xmap("Fj", "F<C-k>j")
xmap("tj", "t<C-k>j")
xmap("Tj", "T<C-k>j")

-- レジスタ名とmodeが相関を持つようにする
nmap("x", '"xx')

-- Esc設定
imap("jk", "<Esc>")
nmap("<Esc><Esc>", ":noh<CR>")
