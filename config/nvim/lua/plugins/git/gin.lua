-- Git操作
return {
	-- git操作をVimから
	-- lazygitの方をメインで使うので一旦消す
	-- {
	--   'lambdalisue/gin.vim',
	--   lazy = false,
	--   dependencies = {
	--     'vim-denops/denops.vim',
	--   },
	--   keys = {
	--     {'<leader>ga', ':silent Gin add .<CR>', silent=true},
	--     {'<leader>gc', ':silent Gin commit<CR>', silent=true},
	--     {'<leader>gp', ':silent Gin push<CR>', silent=true},

	--     {'<leader>gs', ':GinStatus <CR>'},
	--     {'<leader>gb', ':GinBranch <CR>'},
	--     {'<leader>gbr', ':GinBrowse <CR>'},
	--   },
	--   config = function ()
	--     g['gin_proxy_apply_without_confirm'] = 1
	--   end
	-- },
	--
}
