-- keymapの補完表示
return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  init = function()
    o.timeout = true
    o.timeoutlen = 300
  end,
  opts = {
    defaults = {
        mode = { "n", "v" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>L"] = { name = "+lazy" },
        ["<leader>q"] = { name = "+session" },
        ["<leader>f"] = { name = "+find" },
      },
  }
}
