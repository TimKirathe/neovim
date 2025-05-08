return {
	"folke/neoconf.nvim",
	config = function()
		-- neoconf needs to be setup before lspconfig
		require("neoconf").setup()
	end,
}
