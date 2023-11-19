-- ファイラー
return {
  'lambdalisue/fern.vim',
  -- lazy=false,
  dependencies = {
    -- アイコン類
    {'lambdalisue/nerdfont.vim'},
    {
      'lambdalisue/fern-renderer-nerdfont.vim',
      ft='fern',
      config = function()
        g['fern#renderer'] = "nerdfont"
      end
    },
    -- アイコン類
    {
      'lambdalisue/glyph-palette.vim',
      ft='fern',
      config = function()
        fn['glyph_palette#apply']()
      end
    },
    -- fernをデフォルトのエクスプローラーに
    {
      'lambdalisue/fern-hijack.vim',
      config = function()
        api.nvim_set_var('loaded_netrwPlugin', 1)
      end
    },
    -- git statusを表示
    -- { 'lambdalisue/fern-git-status.vim' },
    -- ファイルのプレビュー
    {
      'yuki-yano/fern-preview.vim',
      ft='fern',
      -- keys = {
      --   {"p", "<Plug>(fern-action-preview:toggle)", {silent=true, buffer=true}},
      --   {"<C-p>", "<Plug>(fern-action-preview:auto:toggle)", {silent=true, buffer=true}},
      --   {"<C-d>", "<Plug>(fern-action-preview:scroll:down:half)", {silent=true, buffer=true}},
      --   {"<C-u>", "<Plug>(fern-action-preview:scroll:up:half)", {silent=true, buffer=true}},
      -- },
      cmd[[
        function! s:fern_settings() abort
           nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
           nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
           nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
           nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)

           nmap <buffer> sa <Plug>(fern-action-open:select)
           nmap <buffer> ss <Plug>(fern-action-open:split)
           nmap <buffer> sd <Plug>(fern-action-open:vsplit)
        endfunction

        augroup fern-settings
           autocmd!
           autocmd FileType fern call s:fern_settings()
        augroup END
      ]]
    },
  },
  keys = {
    -- open as side bar
    -- {"<F2>", ":Fern . -reveal=% -drawer -toggle -width=40<CR>", silent=true},
    -- {"<F3>", ":Fern . -reveal=% -drawer -toggle -width=40<CR>", silent=true},
    -- {"sa", "<Plug>(fern-action-open:select)", {silent=true, buffer=true}},
    -- {"ss", "<Plug>(fern-action-open:split)", {silent=true, buffer=true}},
    -- {"sd", "<Plug>(fern-action-open:vsplit)", {silent=true, buffer=true}}
  },
},
