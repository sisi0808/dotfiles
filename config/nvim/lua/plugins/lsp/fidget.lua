-- lspの設定状況を表示
return {
  'j-hui/fidget.nvim',
  event = 'LspAttach',
  config = function()
    require("fidget").setup()
  end
}
