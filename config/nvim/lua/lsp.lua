-- 1. LSP Server management
require("mason").setup({
	ui = { border = "single" },
})
require("lspconfig.ui.windows").default_options.border = "single"

-- lua_lsに各Pluginの補完情報を追加する
---@param names string[]
---@return string[]
local function get_plugin_paths(names)
	local plugins = require("lazy.core.config").plugins
	local paths = {}
	for _, name in ipairs(names) do
		if plugins[name] then
			table.insert(paths, vim.fs.joinpath(plugins[name].dir, "lua"))
		else
			vim.notify("Invalid plugin name: " .. name)
		end
	end
	return paths
end

---@param plugins string[]
---@return string[]
local function library(plugins)
	local paths = get_plugin_paths(plugins)
	table.insert(paths, vim.fs.joinpath(vim.fn.stdpath("config"), "lua"))
	table.insert(paths, vim.fs.joinpath(vim.env.VIMRUNTIME, "lua"))
	table.insert(paths, "${3rd}/luv/library")
	table.insert(paths, "${3rd}/busted/library")
	table.insert(paths, "${3rd}/luassert/library")
	return paths
end

require("mason-lspconfig").setup({
	ensure_installed = {
		"efm",
		"lua_ls",
		"bashls",
		"clangd",
		"cmake",
		"rust_analyzer",
		"pyright",
	},
	automatic_installation = true,
	handlers = {
		function(server)
			require("lspconfig")[server].setup({})
		end,
		["rust_analyzer"] = function()
			require("rust-tools").setup({})
		end,
		["lua_ls"] = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
							pathStrict = true,
							path = { "?.lua", "?/init.lua" },
						},
						workspace = {
							library = library({ "lazy.nvim", "nvim-insx" }),
							checkThirdParty = false,
						},
						diagnostics = {
							enable = false,
						},
						format = {
							enable = false,
						},
					},
				},
			})
		end,
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		markdown = { "markdownlint" },
	},
})

require("lint").linters_by_ft = {
	lua = { "luacheck" },
	markdown = { "markdownlint" },
}

-- Virtual textを表示しない
-- vim.diagnostic.config({ virtual_text = false })
-- (LSPからの)Virtual textを表示しない
-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
-- 	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

-- require("lspconfig").efm.setup({
--   init_options = {
--     documentFormatting = true,
--     documentRangeFormatting = true,
--   },
--   settings = {
--     rootMarkers = {
--       ".git/",
--     },
--     languages = {
--       lua = {
--         require('efmls-configs.linters.luacheck'),
--         require('efmls-configs.formatters.stylua'),
--       },
--       markdown = {
--         require('efmls-configs.linters.markdownlint'),
--       },
--     },
--   },
--   filetypes = {
--     "lua",
--     "markdown",
--     "cpp",
--   },
-- })

-- 2. LSP keymaps
nmap("ge", vim.diagnostic.open_float)
nmap("g[", vim.diagnostic.goto_prev)
nmap("g]", vim.diagnostic.goto_next)

-- lspを起動している時のみキーマップを起動
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { noremap = true, silent = true, buffer = ev.buf }
		nmap("K", vim.lsp.buf.hover, opts)
		nmap("gd", vim.lsp.buf.definition, opts)
		nmap("gD", vim.lsp.buf.declaration, opts)
		nmap("gt", vim.lsp.buf.type_definition, opts)
		nmap("gn", vim.lsp.buf.rename, opts)
		nmap("ga", vim.lsp.buf.code_action, opts)
		nmap("gi", vim.lsp.buf.implementation, opts)
		nmap("gr", vim.lsp.buf.references, opts)
		nmap("gf", function()
			-- vim.lsp.buf.format({ async = true })
			require("conform").format({
				lsp_fallback = true,
			})
		end, opts)
	end,
})

-- 3. Cmp settings
local cmp = require("cmp")
cmp.setup({

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	formatting = {
		format = require("lspkind").cmp_format({
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "...",

			-- before = function(entry, vim_item)
			--   return vim_item
			-- end
		}),
	},

	sources = cmp.config.sources({
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "calc" },
	}, {
		{ name = "buffer", keyword_length = 2 },
		{ name = "path" },
		-- { name = "cmdline" },
	}),

	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),

		["<C-n>"] = cmp.mapping.select_next_item(),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),

		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),

		["<C-j>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "nvim_lsp_document_symbol" },
	},
	{
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline", keyword_length = 2 },
	}),
})
