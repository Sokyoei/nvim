return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters = {
                clang_format = {
                    command = "clang-format",
                },
                black = {
                    command = "black",
                    args = { "--fast" },
                },
                ruff = {
                    command = "ruff",
                    args = { "--fix", "-e", "-n" },
                },
            },
            formatters_by_ft = {
                ["c"] = { "clang_format" },
                ["cpp"] = { "clang_format" },
                ["lua"] = { "stylua" },
                ["python"] = { "black", "ruff" },
                ["sh"] = { "shfmt" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },
}
