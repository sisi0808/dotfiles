-- copilot
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  lazy = false,
  config = function()
    require('copilot').setup({
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<C-l>",
        accept_word = false,
        accept_line = false,
        next = "<M-o>",
        prev = "<M-i>",
        dismiss = "<C-]>",
      },
      },
    })
  end,
}
