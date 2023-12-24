-- Obsidianっぽいのを使えるように
return {
  "epwalsh/obsidian.nvim",
  ft = "markdown",
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre " .. vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian/**.md",
    "BufNewFile " .. vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian/**.md",
    -- "BufReadPre path/to/my-vault/**.md",
    -- "BufNewFile path/to/my-vault/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    notes_subdir = "Files",
    daily_notes = {
      folder = "Daily",
      date_format = "%Y-%m-%d, %a",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "Template/DailyNote.md",
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
      new_notes_location = "notes_subdir",

      -- Control how wiki links are completed with these (mutually exclusive) options:
      --
      -- 1. Whether to add the note ID during completion.
      -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
      -- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
      prepend_note_id = true,
      -- 2. Whether to add the note path during completion.
      -- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
      -- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
      prepend_note_path = false,
      -- 3. Whether to only use paths during completion.
      -- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
      -- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
      use_path_only = false,
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function() return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
    templates = {
      subdir = "Template",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
    use_advanced_uri = true,
     -- Specify how to handle attachments.
    attachments = {
      img_folder = "Public",  -- This is the default
    },
  },
}
