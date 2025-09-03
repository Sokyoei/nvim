local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- add LazyVim and import its plugins
        {
            "LazyVim/LazyVim",
            import = "lazyvim.plugins"
        },

        -------------------------------------------------------------------------------------------------------------------
        -- extras plugins
        -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
        -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
        { import = "lazyvim.plugins.extras.lang.typescript" },
        -- use mini.starter instead of alpha
        -- { import = "lazyvim.plugins.extras.ui.mini-starter" },

        -- BUG:
        -- Failed to run `config` for mini.starter
        -- vim/shared.lua:558: dst: expected table, got nil
        -- # stacktrace:
        -- - vim\shared.lua:1045 _in_ **validate**
        -- - vim\shared.lua:558 _in_ **list_extend**
        -- - LazyVim\lua\lazyvim\plugins\extras\editor\snacks_picker.lua:191 _in_ **values**

        -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
        { import = "lazyvim.plugins.extras.lang.json" },

        -- import/override with your plugins
        { import = "plugins" },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        -- version = false, -- always use the latest git commit
        version = "*", -- try installing the latest stable version for plugins that support semver
    },
    install = {
        colorscheme = { "tokyonight", "habamax" },
        missing = true,
        -- max_tries = 0,    -- max try again is 0
        behavior = "lazy", -- 增量安装模式（不会重新下载已成功的插件）
        concurrency = 5,   -- 并发下载数量（避免网络过载导致失败）
    },
    cache = {
        enabled = true,
    },
    checker = {
        -- enabled = true, -- check for plugin updates periodically
        enabled = false, -- set is false to disable plugin update checker
        notify = false,  -- notify on update
    },                   -- automatically check for plugin updates
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
