-- Java development plugin for Neovim
return {
	"nvim-java/nvim-java",
	dependencies = {
		"nvim-java/lua-async-await",
		"nvim-java/nvim-java-core",
		"nvim-java/nvim-java-test",
		"nvim-java/nvim-java-dap",
		"MunifTanjim/nui.nvim",
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		{
			"williamboman/mason.nvim",
			opts = {
				registries = {
					"github:nvim-java/mason-registry",
					"github:mason-org/mason-registry",
				},
			},
		},
	},
	config = function()
		require("java").setup()
		require("lspconfig").jdtls.setup({
			settings = {
				java = {
					configuration = {
						runtimes = {
							{
								name = "OpenJDK-17",
								path = "/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents",
								default = true,
							},
						},
					},
					-- Code Stryles
					-- format = {
					--   enabled = true,
					--   settings = {
					--     url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
					--     profile = "co",
					--   },
					-- },
				},
			},
		})
	end,
}
