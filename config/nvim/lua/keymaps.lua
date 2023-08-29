-- Pluginが関係無いKeymapを設定する

-- leaderキーをspaceキーに設定
g.mapleader = " "

-- カーソル移動
nmap('<leader>4', '$')
nmap('<leader>6', '^')

-- ファイル保存・終了
nmap('<leader>w', ':w<CR>')
nmap('<leader>q', ':q<CR>')
nmap('<leader>wq', ':wq<CR>')

-- タブ設定
-- 新規タブをホームディレクトリで
-- nmap('<C-t>', ':tabe ~/<CR>')
-- 新規タブを同じディレクトリで
nmap('<C-t>', ':tabe .<CR>')
nmap('<C-p>', 'gt')
nmap('<C-n>', 'gT')

-- Terminalモード設定
-- tmap('<Esc>', '<C-\\><C-n>')
-- cmd('command! -nargs=* T split | wincmd j | resize 20 | terminal <args>')
-- nmap('<leader>t', ':T<CR>')

-- ウィンドウ操作
nmap('<leader>s', '<C-w>s')
nmap('<leader>v', '<C-w>v')
-- nmap('<leader>wr', ':new ~/.config/nvim/init.lua<CR>', {silent = true })
nmap('<leader>ww', ':source ~/.config/nvim/init.lua<CR>', {silent = true })
nmap('<leader>wr', ':new ~/.config/nvim/lua/plugins.lua<CR>', {silent = true })
-- nmap('<leader>ww', ':source ~/.config/lua/plugins.lua<CR>', {silent = true })

-- ウィンドウ移動
nmap('sh', '<C-w>h')
nmap('sj', '<C-w>j')
nmap('sk', '<C-w>k')
nmap('sl', '<C-w>l')
nmap('sH', '<C-w>H')
nmap('sJ', '<C-w>J')
nmap('sK', '<C-w>K')
nmap('sL', '<C-w>L')

-- インデントを揃えたペースト
nmap('p', ']p')
nmap('P', ']P')

-- 空行を挿入
nmap('<leader>o', 'o<ESC>k')
nmap('<leader>O', 'O<ESC>j')

-- カーソル下の単語を、置換後の文字列の入力を待つ状態にする
nmap('<leader>re', ':%s;\\<<C-R><C-W>\\>;g<Left><Left>', {silent = true })

-- Digraph設定
nmap('fj', 'f<C-k>')
nmap('Fj', 'F<C-k>')
nmap('tj', 't<C-k>')
nmap('Tj', 'T<C-k>')

-- Esc設定
imap('jk', '<Esc>')
