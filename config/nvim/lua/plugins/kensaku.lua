-- 日本語での検索補助
return {
  'lambdalisue/kensaku.vim',
  lazy = false,
  dependencies = {
    -- denoの実行環境
    'vim-denops/denops.vim',
    -- /と?の検索でkensaku.vimを使う
    'lambdalisue/kensaku-search.vim'
  },
  keys = {
    -- /と?の検索でkensaku.vimを使う
    { '<CR>', '<Plug>(kensaku-search-replace)<CR>', mode='c', silent=true },
  }
}
