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

-- -- auto format
-- vim.api.nvim_create_autocmd("bufwritepost", {
-- 	pattern = "*.rs",
-- 	group = vim.api.nvim_create_augroup("autoformat", {}),
-- 	callback = function()
-- 		vim.cmd("silent !rustfmt --quiet %")
-- 		vim.cmd("edit")
-- 	end,
-- })

-- Activeなウインドウだけrelative numberを有効にする
-- 元々Numberが設定されていた時のみ有効
-- local augroup = vim.api.nvim_create_augroup("Numbertoggle", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
-- 	pattern = "*",
-- 	group = augroup,
-- 	callback = function()
-- 		if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
-- 			vim.opt.relativenumber = true
-- 		end
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
-- 	pattern = "*",
-- 	group = augroup,
-- 	callback = function()
-- 		if vim.o.nu then
-- 			vim.opt.relativenumber = false
-- 			vim.cmd("redraw")
-- 		end
-- 	end,
-- })

-- 今開いているバッファのファイル名をヤンク
vim.api.nvim_create_user_command("Nameyank", 'let @+ = expand("%")', {})

-- 日付を挿入
vim.api.nvim_create_user_command("Date",
  function()
    local yanked_text = vim.fn.strftime("%Y-%m-%d")
    vim.api.nvim_put({yanked_text}, 'c', true, true)
  end,
{})

-- 日付を挿入
vim.api.nvim_create_user_command("Time",
  function()
    local yanked_text = vim.fn.strftime("%H:%M")
    vim.api.nvim_put({yanked_text}, 'c', true, true)
  end,
{})

-- レジスタの名前にmodeの情報を対応させる
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("use-easy-regname", {}),
	callback = function()
		if vim.v.event.regname == "" then
			vim.fn.setreg(vim.v.event.operator, vim.fn.getreg())
		end
	end,
})

-- linterの起動タイミングを設定
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

-- 即時メモを起動
local memo_path = vim.fn.expand('~/.local/share/memo.md')

-- メモを開閉する関数
local function memo_toggle()
  -- 既に開いていた場合はメモを閉じる
  if vim.fn.expand('%') == memo_path then
    vim.cmd('write')
    vim.cmd('bdelete')
    return
  end

  -- ファイル編集開始 & ローカルオプション設定
  vim.cmd('edit ' .. memo_path)
  vim.opt_local.bufhidden = 'wipe'
  vim.opt_local.swapfile = false

  -- 自動保存設定
  vim.api.nvim_create_autocmd(
    { "InsertLeave", "TextChanged", "BufLeave" },
    { buffer = 0, command = "silent! update" }
  )
end

vim.api.nvim_create_user_command('Memo', memo_toggle, {})
vim.api.nvim_set_keymap('n', 'mo', '<Cmd>Memo<CR>', { noremap = true, silent = true })


-- formatterの起動タイミングを設定
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	callback = function(args)
-- 		require("conform").format({ bufnr = args.buf })
-- 	end,
-- })
