return {
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

    -- https://github.com/nvim-lualine/lualine.nvim
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

    -- Dashboard
--     {
--         "snacks.nvim",
--         opts = {
--             dashboard = {
--                 preset = {
--                     pick = function(cmd, opts)
--                         return LazyVim.pick(cmd, opts)()
--                     end,
--                     header = [[
-- ██████╗  ██████╗ ██████╗ ███████╗████████╗ █████╗ ██████╗      █████╗ ██╗  ██╗██████╗ ██╗
-- ██╔══██╗██╔═══██╗██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔══██╗    ██╔══██╗██║  ██║██╔══██╗██║
-- ██████╔╝██║   ██║██████╔╝███████╗   ██║   ███████║██████╔╝    ███████║███████║██████╔╝██║
-- ██╔═══╝ ██║   ██║██╔═══╝ ╚════██║   ██║   ██╔══██║██╔══██╗    ██╔══██║██╔══██║██╔══██╗██║
-- ██║     ╚██████╔╝██║     ███████║   ██║   ██║  ██║██║  ██║    ██║  ██║██║  ██║██║  ██║██║
-- ╚═╝      ╚═════╝ ╚═╝     ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝
--  ]],
--                     -- stylua: ignore
--                     ---@type snacks.dashboard.Item[]
--                     -- keys = {
--                     --     { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
--                     --     { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
--                     --     { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
--                     --     { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
--                     --     { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
--                     --     { icon = " ", key = "s", desc = "Restore Session", section = "session" },
--                     --     { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
--                     --     { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
--                     --     { icon = " ", key = "q", desc = "Quit", action = ":qa" },
--                     -- },
--                 },
--             },
--         },
--     }
}
