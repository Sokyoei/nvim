return {
    {
        -- "williamboman/mason.nvim", -- old name
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua", -- Lua formatter
                "shellcheck",
                "shfmt",
                "flake8",
                "prettier",
            },
        },
    },
}
