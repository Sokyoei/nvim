return {
    -- Python venv support
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
            -- optional: you can also use fzf-lua, snacks, mini-pick instead.
        },
        ft = "python",                       -- Load when opening Python files
        keys = {
            { ",v", "<cmd>VenvSelect<cr>" }, -- Open picker on keymap
        },
        opts = {                             -- this can be an empty lua table - just showing below for clarity.
            search = {},                     -- if you add your own searches, they go here.
            options = {}                     -- if you add plugin options, they go here.
        },
    },

    -- CMake
    {
        'Civitasv/cmake-tools.nvim',
        dependencies = { "nvim-lua/plenary.nvim" }, -- 依赖的工具库
        config = function()
            require("cmake-tools").setup({
                cmake_command = "cmake",
                cmake_build_directory = "build",
                cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
                cmake_build_options = { "-j8" },
                cmake_soft_link_compile_commands = true,
            })
        end
    },
}
