set number "行番号の表示
set relativenumber "相対的行番号の表示
set list "タブ、空白、改行を可視化
set title "編集中ファイル名の表示
set visualbell t_vb= "ビープ音を視覚表示
set laststatus=2 "ステータスを表示
set ruler "カーソル位置を表示
set ambiwidth=double "○や□などの文字が重ならないようにする
syntax on "コードに色をつける

set backspace=indent,eol,start "バックスペースでの行移動を可能にする
set expandtab "タブをスペースに変換する
set autoindent "自動インデント
set smartindent "オートインデント
set virtualedit=onemore "カーソルを行末の一つ先まで移動可能にする
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

set smartindent "インテンドを整える

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
" space 4で行末へ移動
nnoremap <Leader>4 $
" space 6で行頭へ移動
nnoremap <Leader>6 ^
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :q<CR>
" nnoremap <Leader>h :<C-u>split<CR>
" nnoremap <Leader>v :<C-u>vsplit<CR>
nnoremap <Leader>s <C-w>s
nnoremap <Leader>v <C-w>v
" noremap <Leader>a myggVG$
" inoremap <Leader>a <Esc>myggVG$
nnoremap <silent> <Leader>vr :new ~/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader>r :source ~/.config/nvim/init.vim<CR>
"編集中ファイルのリネーム
map <leader>n :call RenameCurrentFile()<cr> 

nnoremap p ]p
nnoremap P ]P

vnoremap < <gv
vnoremap > >gv

" 空行を挿入
nnoremap <Leader>o o<ESC>k
nnoremap <Leader>O O<ESC>j

" カーソル下の単語を、置換後の文字列の入力を待つ状態にする
nnoremap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;

" ウインドウ移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L

nnoremap fj f<C-k>
nnoremap Fj F<C-k>
nnoremap tj t<C-k>
nnoremap Tj T<C-k>

set wildmenu
set encoding=utf8
syntax enable

" PLUGIN SETTINGS
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/vim-maketable'
Plug 'unblevable/quick-scope'
Plug 'haya14busa/vim-edgemotion'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-sonictemplate'
Plug 'brglng/vim-im-select'
Plug 'tpope/vim-markdown'
call plug#end()

" vim-markdown settings
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" vim-im-select
let g:im_select_default = 'com.apple.inputmethod.Kotoeri.RomajiTyping.Roman'

" NERDTree SETTINGS
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

let g:airline#extensions#tabline#enabled = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" VIm-Edgemotion
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

" Airline SETTINGS
let g:airline_powerline_fonts = 1

" Session Setting
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>

" Esc SETTINGS
inoremap jk <Esc>

" Increment/Decrement
nnoremap - <C-a>
nnoremap + <C-x>

" Easymotion Setting
noremap <leader>f <Plug>(easymotion-overwin-w)
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

" let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" let $FZF_DEFAULT_OPTS="--layout=reverse"
" let $FZF_DEFAULT_COMMAND="Rg --files --hidden --glob"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
nnoremap <silent> <leader>e :Files<CR>
nnoremap <silent> <leader>rg :Rg<CR>

" /// Enable Netrw (default file browser)
filetype plugin on
" /// Netrw SETTINGS
let g:netwr_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 30
let g:netrw_sizestyle = "H"
let g:netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_preview = 1

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

"/// SPLIT BORDER SETTINGS
hi VertSplit cterm=none

" Terminal Mode
"
:tnoremap <Esc> <C-\><C-n>
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
" autocmd TermOpen * startinsert

" Undoの永続化
if has('persistent_undo')
	let undo_path = expand('~/.config/nvim/undo')
	exe 'set undodir=' .. undo_path
	set undofile
endif

" VsCodeのための除外指定
if !exists('g:vscode')
    set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮ "不可視文字の指定
endif

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
