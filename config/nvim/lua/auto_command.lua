-- api.nvim_create_autocmd({ 'CursorHold' }, {
--   pattern = { '*' },
--   callback = function()
--     require('lspsaga.diagnostic').show_cursor_diagnostics()
--   end,
-- })
--
-- ファイルが変更されたら自動で読み込む vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
--   command = "if mode() != 'c' | checktime | endif",
--   pattern = { "*" },
-- })
--
--

-- auto format
api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.rs",
        group = api.nvim_create_augroup("AutoFormat", {}),
        callback = function()
            cmd("silent !rustfmt --quiet %")
            cmd("edit")
        end,
    }
)

-- Activeなウインドウだけrelative numberを有効にする
local augroup = api.nvim_create_augroup("Numbertoggle", {clear=true})
api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
    pattern = "*",
    group = augroup,
    callback = function()
        if api.nvim_get_mode().mode ~= "i" then
            opt.relativenumber = true
        end
    end,
})

api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
    pattern = "*",
    group = augroup,
    callback = function()
        opt.relativenumber = false
        cmd("redraw")
    end,
})

-- 今開いているバッファのファイル名をヤンク
api.nvim_create_user_command('Nameyank', 'let @+ = expand("%")', {})
