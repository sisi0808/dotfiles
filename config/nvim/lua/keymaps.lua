-- Pluginが関係無いKeymapを設定する

-- leaderキーをspaceキーに設定
g.mapleader = " "

-- カーソル移動
nmap('<leader>4', '$')
nmap('<leader>6', '^')

-- ファイル保存・終了
nmap('<leader>w', ':w<CR>')
nmap('<leader>q', ':q<CR>')
nmap('<leader>wa', ':w<CR>')
nmap('<leader>qa', ':q<CR>')
nmap('<leader>qa', ':qa<CR>')
nmap('<leader>wq', ':wq<CR>')

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
nmap('<leader>ww', ':source ~/.config/nvim/init.lua<CR>', {silent = true} )
nmap('<leader>wr', ':new ~/.config/nvim/init.lua<CR>', {silent = true} )

-- ウィンドウ操作
nmap('ss', ':split<CR>')
nmap('sv', ':vsplit<CR>')

-- ウィンドウ移動
nmap('sh', '<C-w>h')
nmap('sj', '<C-w>j')
nmap('sk', '<C-w>k')
nmap('sl', '<C-w>l')

nmap('sH', '<C-w>H')
nmap('sJ', '<C-w>J')
nmap('sK', '<C-w>K')
nmap('sL', '<C-w>L')


nmap('so', '<cmd>bnext<cr>')
nmap('si', '<cmd>bprevious<cr>')
-- nmap('sn', '<cmd>bnext<cr>')
-- nmap('sp', '<cmd>bprevious<cr>')

nmap('s-', '<C-w>-')
nmap('s+', '<C-w>+')
nmap('s>', '<C-w>>')
nmap('s<', '<C-w><')
nmap('s=', '<C-w>=')

-- QuickFix
nmap(']q', ':cnext<CR>')
nmap('[q', ':cprev<CR>')
nmap('<C-q>', ':call QuickFixToggle()<CR>')

-- インデントを揃えたペースト
nmap('p', ']p')
nmap('P', ']P')

-- 空行を挿入
nmap('<leader>o', 'o<ESC>k')
nmap('<leader>O', 'O<ESC>j')

-- カーソル下の単語を、置換後の文字列の入力を待つ状態にする
-- nmap('<leader>re', ':%s;\\<<C-R><C-W>\\>;g<Left><Left>', {silent = true })

-- Digraph設定
nmap('fj', 'f<C-k>')
nmap('Fj', 'F<C-k>')
nmap('tj', 't<C-k>')
nmap('Tj', 'T<C-k>')

-- Esc設定
imap('jk', '<Esc>')
nmap('<Esc><Esc>', ':noh<CR>')

-- lsp
nmap('ge', 'open_float')
nmap('g[', 'vim.diagnostic.goto_prev')
nmap('g]', 'vim.diagnostic.goto_next')

-- lspを起動している時のみキーマップを起動
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opt = { buffer=ev.buf }
    nmap('K', vim.lsp.buf.hover, opt)
    nmap('gd', vim.lsp.buf.definition, opt)
    nmap('gD', vim.lsp.buf.declaration, opt)
    nmap('gt', vim.lsp.buf.type_definition, opt)
    nmap('gn', vim.lsp.buf.rename, opt)
    nmap('ga', vim.lsp.buf.code_action , opt)
    nmap('gi', vim.lsp.buf.implementation, opt)
    nmap('gr', vim.lsp.buf.references, opt)
    nmap('gf', vim.lsp.buf.formatting, opt)
  end
})

