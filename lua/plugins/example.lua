-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
    --------------------------------------------------------------------------------------------------------------------
    -- 主题插件
    -- add gruvbox
    -- { "ellisonleao/gruvbox.nvim" },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000
    -- },
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = true,           -- 透明背景
            styles = {
                sidebars = "transparent", -- 侧边栏透明
                floats = "transparent",   -- 浮动窗口透明
            },
        },
    },

    --------------------------------------------------------------------------------------------------------------------
    -- LazyVim 核心插件
    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
            transparent = true, -- 强制使用终端背景颜色
        },
    },

    --------------------------------------------------------------------------------------------------------------------
    -- trouble 错误诊断插件
    -- change trouble config
    {
        "folke/trouble.nvim",
        -- opts will be merged with the parent spec
        opts = { use_diagnostic_signs = true },
    },

    -- disable trouble
    {
        "folke/trouble.nvim",
        enabled = false
    },

    --------------------------------------------------------------------------------------------------------------------
    -- nvim-cmp 自动补全插件
    -- override nvim-cmp and add cmp-emoji
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji" },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            table.insert(opts.sources, { name = "emoji" })
        end,
    },

    --------------------------------------------------------------------------------------------------------------------
    -- 文件搜索插件
    -- change some telescope options and a keymap to browse plugin files
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            -- add a keymap to browse plugin files
            -- stylua: ignore
            {
                "<leader>fp",
                function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
                desc = "Find Plugin File",
            },
        },
        -- change some options
        opts = {
            defaults = {
                layout_strategy = "horizontal",              -- 水平布局
                layout_config = { prompt_position = "top" }, -- 搜索框置为顶部
                sorting_strategy = "ascending",              -- 升序排序
                winblend = 100,                              -- 窗口透明度（0~100, 0 为完全不透明）
            },
        },
    },

    --------------------------------------------------------------------------------------------------------------------
    -- LSP 核心插件配置
    -- add pyright to lspconfig
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- pyright will be automatically installed with mason and loaded with lspconfig
                -- Python LSP server
                pyright = {},
                -- C/C++/CUDA LSP server
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",      -- 建立后台索引，提高代码导航性能
                        "--clang-tidy",            -- 代码风格检查
                        "--header-insertion=iwyu", -- 自动插入头文件（遵循 IWYU 原则）
                    },
                },
            },
        },
    },

    -- add tsserver and setup with typescript.nvim instead of lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/typescript.nvim",
            init = function()
                require("lazyvim.util").lsp.on_attach(function(_, buffer)
                    -- stylua: ignore
                    vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports",
                        { buffer = buffer, desc = "Organize Imports" })
                    vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
                end)
            end,
        },
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- tsserver will be automatically installed with mason and loaded with lspconfig
                tsserver = {},
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                tsserver = function(_, opts)
                    require("typescript").setup({ server = opts })
                    return true
                end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
    },

    -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
    -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
    -- { import = "lazyvim.plugins.extras.lang.typescript" },

    --------------------------------------------------------------------------------------------------------------------
    -- Treesitter 语法高亮插件
    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
        },
    },

    -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
    -- would overwrite `ensure_installed` with the new value.
    -- If you'd rather extend the default config, use the code below instead:
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            -- add tsx and treesitter
            vim.list_extend(opts.ensure_installed, {
                "tsx",
                "typescript",
            })
        end,
    },

    --------------------------------------------------------------------------------------------------------------------
    -- lualine 状态栏插件
    -- the opts function can also be used to change the default opts:
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, {
                function()
                    return "😄"
                end,
            })
        end,
    },

    -- or you can return new options to override all the defaults
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                --[[add your custom lualine config here]]
            }
        end,
    },

    -- use mini.starter instead of alpha
    -- { import = "lazyvim.plugins.extras.ui.mini-starter" },

    -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
    -- { import = "lazyvim.plugins.extras.lang.json" },

    --------------------------------------------------------------------------------------------------------------------
    -- Mason 包管理器配置
    -- add any tools you want to have installed below
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua", -- Lua formatter
                "shellcheck",
                "shfmt",
                "flake8",
            },
        },
    },

    --------------------------------------------------------------------------------------------------------------------
    -- conform 代码格式化配置
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
                c = { "clang_format" },
                cpp = { "clang_format" },
                lua = { "stylua" },
                python = { "black", "ruff" },
                sh = { "shfmt" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },
}
