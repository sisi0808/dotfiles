-- 囲まれているものの操作
return {
  'machakann/vim-sandwich',
  config = function()
   cmd("runtime macros/sandwich/keymap/surround.vim")
  end
}
