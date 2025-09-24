return {
    {
        "folke/tokyonight.nvim",
        opts = {
            lazy = false,
            priority = 1000,
            transparent = true,           -- 透明背景
            styles = {
                sidebars = "transparent", -- 侧边栏透明
                floats = "transparent",   -- 浮动窗口透明
            },
        },
    },
}
