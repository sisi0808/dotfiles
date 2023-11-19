-- keymapの補完表示
return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  init = function()
    o.timeout = true
    o.timeoutlen = 300
  end,
  opts = {}
}
