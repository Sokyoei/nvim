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
}
