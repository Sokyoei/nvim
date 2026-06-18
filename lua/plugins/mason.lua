-- Mason 包管理器
-- https://github.com/mason-org/mason.nvim

return {
    {
        -- "williamboman/mason.nvim", -- old name
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",              -- Lua formatter
                "lua-language-server", -- Lua LSP server
                "shellcheck",
                "shfmt",
                "flake8",
                "prettier",
                "pyright",               -- Python LSP server
                "clangd",                -- C/C++/CUDA LSP server
                "cmake-language-server", -- CMake LSP server
                "json-lsp",              -- JSON LSP server
                "tree-sitter-cli",       -- Tree-Sitter CLI
            },
        },
    },
}
