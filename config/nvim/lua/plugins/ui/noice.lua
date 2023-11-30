-- 通知のポップアップをかっこよく
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    messages = { 
      enabled = false
      -- view = "messages"
      -- excluded_filetypes = {"fern"}
    }
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  keys = {
    {"<leader>nn", ":Noice<CR>", desc="Noice", silent=true },
    {"<leader>ne", ":NoiceErrors<CR>", desc="Errors", silent=true },
    {"<leader>nh", ":NoiceHistory<CR>", desc="History", silent=true },
    {"<leader>nl", ":NoiceLast<CR>", desc="Last", silent=true }
  }
}
