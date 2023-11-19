-- セッション管理 
return {
  "olimorris/persisted.nvim",
  -- event = "BufReadPre",
  -- event = "VeryLazy",
  lazy = false,
  opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
  -- stylua: ignore
  keys = {
    { "<leader>qs", function() require("persisted").load() end, desc = "Restore Session" },
    { "<leader>ql", function() require("persisted").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>qd", function() require("persisted").stop() end, desc = "Don't Save Current Session" },
  },
  config = function()
    require("persisted").setup({
      save_dir = fn.expand(fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
      silent = false, -- silent nvim message when sourcing session file
      use_git_branch = false, -- create session files based on the branch of the git enabled repository
      autosave = true, -- automatically save session files when exiting Neovim
      -- should_autosave = nil, -- function to determine if a session should be autosaved
      should_autosave = function()
      -- do not autosave if the alpha dashboard is the current filetype
        if vim.bo.filetype == "alpha" then
          return false
        end
        return true
      end,
      -- autoload = true, -- automatically load the session for the cwd on Neovim startup
      on_autoload_no_session = function()
        vim.notify("No existing session to load.")
      end,
      follow_cwd = true, -- change session file name to match current working directory if it changes
      allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
      ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
      telescope = { -- options for the telescope extension
        reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
      },
    })
  end
}
