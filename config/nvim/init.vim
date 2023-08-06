set relativenumber "行番号の表示
set list "タブ、空白、改行を可視化
set title "編集中ファイル名の表示
set visualbell t_vb= "ビープ音を視覚表示
set laststatus=2 "ステータスを表示
set ruler "カーソル位置を表示
set ambiwidth=double "○や□などの文字が重ならないようにする

set backspace=indent,eol,start "バックスペースでの行移動を可能にする
set virtualedit=onemore "カーソルを行末の一つ先まで移動可能にする
set expandtab "タブをスペースに変換する
set autoindent "自動インデント
set smartindent "オートインデント
set tabstop=2 "タブをスペース2つ分に設定
set shiftwidth=2 "インテンドをスペース二つ分

set ignorecase "大文字、小文字の区別をしない
set smartcase "大文字が含まれている場合は区別する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索した文字を強調
set incsearch "インクリメンタルサーチを有効にする

set history=1000 "履歴を1000件保存
set clipboard+=unnamed "コピーしたときはクリップボードを使用
set nobackup "バックアップファイルを作らない
set noswapfile "スワップファイルを作らない
set autoread "編集中のファイルが変更されたら、自動的に読み込み直す

set wildmenu "補完の強化
set encoding=utf8 "エンコーディングの設定
set noundofile "Undoの永続化

syntax enable "シンタックスをオン

"diagraph setting
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

" Leaderキーをspaceキーに設定
let mapleader = "\<Space>"

" nnoremap <Leader>4 $
" nnoremap <Leader>6 ^
nnoremap <Leader>a ^
nnoremap <Leader>l $
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :q<CR>

" tab settings
nmap <C-t> :tabe ~/<cr> " 新規タブをホームディレクトリで
" nmap <C-t> :tabe<cr> " 新規タブを同じディレクトリで

" Terminal Mode settings
hi VertSplit cterm=none
:tnoremap <Esc> <C-\><C-n>
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
nnoremap <Leader>t :T<CR>

" ウインドウ操作
nnoremap <Leader>s <C-w>s
nnoremap <Leader>v <C-w>v
nnoremap <silent> <Leader>wr :new ~/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader>ww :source ~/.config/nvim/init.vim<CR>

" ウインドウ移動
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L

"編集中ファイルのリネーム
map <leader>n :call RenameCurrentFile()<cr>
" リネーム関数定義
function! RenameCurrentFile()
  let old = expand('%')
  let new = input('新規ファイル名: ', old , 'file')
  if new != '' && new != old
    exec ':saveas ' . new
    exec ':silent !rm ' . old
    redraw!
  endif
endfunction

"インテンドを揃えたペースト
nnoremap p ]p
nnoremap P ]P

" 空行を挿入
nnoremap <Leader>o o<ESC>k
nnoremap <Leader>O O<ESC>j

" カーソル下の単語を、置換後の文字列の入力を待つ状態にする
nnoremap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;


" digraph setting
nnoremap fj f<C-k>
nnoremap Fj F<C-k>
nnoremap tj t<C-k>
nnoremap Tj T<C-k>

" tab moving setting
nmap <C-p> gt
nmap <C-n> gT

" Esc SETTINGS
inoremap jk <Esc>

" Plug Settings
packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1} "bootstrap
Jetpack 'nvim-lualine/lualine.nvim'
Jetpack 'tpope/vim-commentary' "コメントアウト
Jetpack 'nvim-tree/nvim-web-devicons' "Icon
Jetpack 'ryanoasis/vim-devicons' "Icon
Jetpack 'easymotion/vim-easymotion' " easymotion
Jetpack 'tpope/vim-surround' "囲み文字の操作
Jetpack 'tpope/vim-repeat' "vim-surroundの依存
Jetpack 'windwp/nvim-autopairs' "閉じカッコ作成
Jetpack 'junegunn/fzf', { 'do': { -> fzf#install() } } "fuzzyfinder
Jetpack 'junegunn/fzf.vim' "fuzzyfinder
Jetpack 'unblevable/quick-scope' "行内のf文字ハイライト
Jetpack 'xolox/vim-session' "セッション管理
Jetpack 'xolox/vim-misc' "xolox/vim-sessionの依存
Jetpack 'brglng/vim-im-select' "Escで日本語->英語
Jetpack 'vim-jp/vimdoc-ja' "ヘルプ日本語化
Jetpack 'airblade/vim-gitgutter' "Git差分をシンタックス表示
Jetpack 'tpope/vim-fugitive' "Git操作
Jetpack 'neoclide/coc.nvim', {'branch': 'release'} "lsp
Jetpack 'tyru/open-browser.vim' " リンクをブラウザで開く
Jetpack 'github/copilot.vim' "Copilot
Jetpack 'yuttie/comfortable-motion.vim' "画面移動の滑らか化

Jetpack 'lambdalisue/fern.vim' "ファイラー
Jetpack 'lambdalisue/nerdfont.vim' " fern.vim用のアイコン
Jetpack 'lambdalisue/fern-renderer-nerdfont.vim' " fern.vim用のアイコン
Jetpack 'lambdalisue/fern-hijack.vim' " fernをデフォルトのエクスプローラーに
Jetpack 'lambdalisue/glyph-palette.vim' "fern.vim用のアイコン
Jetpack 'lambdalisue/fern-git-status.vim' " fern.vimでgitstatusを表示
call jetpack#end()

let g:jetpack_copy_method='copy' " Neovimのみ使用可能 高速

" 起動時自動でPlugin更新
for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor

" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"coc Setting
"スペースdfでDefinition
nmap <silent> <space>df <Plug>(coc-definition)
"スペースrfでReferences
nmap <silent> <space>rf <Plug>(coc-references)
"スペースfmtでFormat
nmap <silent> <space>fm <Plug>(coc-format)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" vim-im-select
let g:im_select_default = 'com.apple.inputmethod.Kotoeri.RomajiTyping.Roman'

" NERDTree SETTINGS
" nnoremap <silent> <F2> :NERDTreeFind<CR>
" nnoremap <silent> <F3> :NERDTreeToggle<CR>


" Fern Settings
nnoremap <silent> <F2> :Fern . -reveal=% -drawer -toggle -width=40<CR>
nnoremap <silent> <F3> :Fern . -reveal=% -drawer -toggle -width=40<CR>
let g:fern#renderer = 'nerdfont'
" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" GitGutterのための表示セッティング
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red

"" 反映時間を短くする(デフォルトは4000ms)
set updatetime=250

" Session Setting
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>

"vim-fugitive
"sでadd, ccでコミット
nnoremap <leader>gg :Git<CR>

nnoremap <silent><leader>gb :Git blame<CR>
nnoremap <silent><leader>ga :Git add %<CR>
nnoremap <silent><leader>gc :Git commit<CR>
nnoremap <silent><leader>gp :Git push<CR>

nnoremap <silent><leader>gl :Git log<CR>
nnoremap <silent><leader>glp :Git log -p<CR>

" Easymotion Setting
noremap <leader>f <Plug>(easymotion-overwin-w)
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

" Fuzzy find
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
" git管理されていれば:GFiles、そうでなければ:Filesを実行する
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles
  endif
endfun

nnoremap <silent> <leader>e FzfOmniFiles()<CR>
nnoremap <silent> <leader>ee :History<CR>
nnoremap <silent> <leader>rg :Rg<CR>


" lualine settings
lua << END
require('lualine').setup {
options = {
  icons_enabled = true,
  theme = 'gruvbox',
  component_separators = { left = '', right = ''},
  section_separators = { left = '', right = ''},
  disabled_filetypes = {
    statusline = {},
    winbar = {},
  },
  ignore_focus = {},
  always_divide_middle = true,
  colored = true,
  globalstatus = false,
  refresh = {
    statusline = 1000,
    tabline = 1000,
    winbar = 1000,
  }
},
sections = {
  lualine_a = {'mode'},
  lualine_b = {'branch', 'diff'},
  lualine_c = {'filename'},
  lualine_x = {'encoding', 'fileformat', 'filetype'},
  lualine_y = {'progress'},
  lualine_z = {'location'}
},
inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {'filename'},
  lualine_x = {'location'},
  lualine_y = {},
  lualine_z = {}
},
winbar = {},
inactive_winbar = {},
extensions = {}
}
END

" Copilot settings
" 提案を<C-j>で受け入れる
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

imap <silent> <M-i> <Plug>(copilot-next)
imap <silent> <M-o> <Plug>(copilot-previous)


" indent-blankline.nvim 
" lua << END

" vim.opt.list = true
" vim.opt.listchars:append "eol:↴"

" require("indent_blankline").setup {
"     show_end_of_line = true,
" }
" END

" nvim-autopairs
lua << END
require("nvim-autopairs").setup {}
END
