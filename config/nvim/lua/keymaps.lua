-- Pluginが関係無いKeymapを設定する

-- leaderキーをspaceキーに設定
vim.g.mapleader = " "

-- カーソル移動
api.nvim_set_keymap('n', '<leader>4', '$', { noremap = true })
api.nvim_set_keymap('n', '<leader>6', '^', { noremap = true })

-- ファイル保存・終了
api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true })
api.nvim_set_keymap('n', '<leader>wq', ':wq<CR>', { noremap = true })

-- タブ設定
-- 新規タブをホームディレクトリで
api.nvim_set_keymap('n', '<C-t>', ':tabe ~/<CR>', { noremap = true })
-- 新規タブを同じディレクトリで
-- api.nvim_set_keymap('n', '<C-t>', ':tabe<CR>', { noremap = true })

-- タブ移動設定
api.nvim_set_keymap('n', '<C-p>', 'gt', { noremap = true })
api.nvim_set_keymap('n', '<C-n>', 'gT', { noremap = true })

-- Terminalモード設定
api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.cmd('command! -nargs=* T split | wincmd j | resize 20 | terminal <args>')
api.nvim_set_keymap('n', '<leader>t', ':T<CR>', { noremap = true })

-- ウィンドウ操作
api.nvim_set_keymap('n', '<leader>s', '<C-w>s', { noremap = true })
api.nvim_set_keymap('n', '<leader>v', '<C-w>v', { noremap = true })
api.nvim_set_keymap('n', '<leader>wr', ':new ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>ww', ':source ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })

-- ウィンドウ移動
api.nvim_set_keymap('n', 'sh', '<C-w>h', { noremap = true })
api.nvim_set_keymap('n', 'sj', '<C-w>j', { noremap = true })
api.nvim_set_keymap('n', 'sk', '<C-w>k', { noremap = true })
api.nvim_set_keymap('n', 'sl', '<C-w>l', { noremap = true })
api.nvim_set_keymap('n', 'sH', '<C-w>H', { noremap = true })
api.nvim_set_keymap('n', 'sJ', '<C-w>J', { noremap = true })
api.nvim_set_keymap('n', 'sK', '<C-w>K', { noremap = true })
api.nvim_set_keymap('n', 'sL', '<C-w>L', { noremap = true })

-- インデントを揃えたペースト
api.nvim_set_keymap('n', 'p', ']p', { noremap = true })
api.nvim_set_keymap('n', 'P', ']P', { noremap = true })

-- 空行を挿入
api.nvim_set_keymap('n', '<leader>o', 'o<ESC>k', { noremap = true })
api.nvim_set_keymap('n', '<leader>O', 'O<ESC>j', { noremap = true })

-- カーソル下の単語を、置換後の文字列の入力を待つ状態にする
api.nvim_set_keymap('n', '<leader>re', ':%s;\\<<C-R><C-W>\\>;g<Left><Left>', { noremap = true, silent = true })

-- Digraph設定
-- api.nvim_set_keymap('n', 'fj', 'f<C-k>', { noremap = true })
-- api.nvim_set_keymap('n', 'Fj', 'F<C-k>', { noremap = true })
-- api.nvim_set_keymap('n', 'tj', 't<C-k>', { noremap = true })
-- api.nvim_set_keymap('n', 'Tj', 'T<C-k>', { noremap = true })

-- Esc設定
api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
