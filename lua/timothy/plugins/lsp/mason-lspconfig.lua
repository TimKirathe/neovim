return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "lua_ls",
            "bashls",
            "pylsp",
            "denols",
        },
        automatic_enable = false,
    },
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    -- config = function()
    --     require("mason-lspconfig").setup()
    -- end,
}
