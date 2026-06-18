local platform = require("utils.platform")

return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1001, -- this plugin needs to run before anything else
        opts = {
            rocks = { "magick" },
        },
    },

    {
        "3rd/image.nvim",
        -- disable on windows bacause Windows not `ioctl`
        cond = not platform.is_windows(),
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "luarocks.nvim",
        },
        config = function()
            require("image").setup({
                -- backend = "sixel",
                -- backend_options = {
                --     sixel = {
                --         path = "D:/msys64/ucrt64/bin/img2sixel.exe",
                --         options = { "-q", "90" },
                --     },
                -- },
                backend = "imgcat",
                backend_options = {
                    imgcat = {
                        command = "wezterm imgcat",
                        args = { "--width", "80%" },
                    },
                },
                processor = "magick_cli",
                integrations = {
                    markdown = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        only_render_image_at_cursor = true,         -- defaults to false
                        only_render_image_at_cursor_mode = "popup", -- "popup" or "inline", defaults to "popup"
                        filetypes = { "markdown", "vimwiki" },
                    },
                },
                auto_resize = false,
                max_width_window_percentage = 100,
                max_height_window_percentage = 100,
                window_overlap_clear_enabled = false,
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
            })
        end,
    },

    {
        "adelarsq/image_preview.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("image_preview").setup({
                backend = "wezterm",
                open_cmd = "start",
                auto_preview = false,
                integrations = {
                    nvim_tree = {
                        enabled = false,
                    },
                },
                max_width = 0.8,
                max_height = 0.8,
                close_on_insert = true,
            })

            vim.keymap.set("n", "<leader>p", function()
                local path = vim.fn.expand("%:p")
                if path == "" then
                    return vim.notify("No file in current buffer", vim.log.levels.WARN)
                end
                require("image_preview").PreviewImage(path)
            end, { desc = "Preview image (current file)" })
        end,
    }
}
