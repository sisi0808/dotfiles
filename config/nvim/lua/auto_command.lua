-- vim.api.nvim_create_autocmd({ 'CursorHold' }, {
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
vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.rs",
        group = vim.api.nvim_create_augroup("AutoFormat", {}),
        callback = function()
            vim.cmd("silent !rustfmt --quiet %")
            vim.cmd("edit")
        end,
    }
)

-- Activeなウインドウだけrelative numberを有効にする
local augroup = vim.api.nvim_create_augroup("Numbertoggle", {clear=true})
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
    pattern = "*",
    group = augroup,
    callback = function()
        if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
            vim.opt.relativenumber = true
        end
    end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
    pattern = "*",
    group = augroup,
    callback = function()
        if vim.o.nu then
            vim.opt.relativenumber = false
            vim.cmd("redraw")
        end
    end,
})

-- 今開いているバッファのファイル名をヤンク
vim.api.nvim_create_user_command('Nameyank', 'let @+ = expand("%")', {})

-- レジスタの名前にmodeの情報を対応させる
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("use-easy-regname", {}),
  callback = function()
    if vim.v.event.regname == "" then
      vim.fn.setreg(vim.v.event.operator, vim.fn.getreg())
    end
  end,
})
