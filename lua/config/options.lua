-- -- Options are automatically loaded before lazy.nvim startup
-- -- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- -- Add any additional options here


vim.opt.number = true         -- 启用行号
vim.opt.relativenumber = true -- 启用相对行号

-- 缩进设置
vim.opt.shiftwidth = 4     -- 自动缩进的空格数
vim.opt.tabstop = 4        -- Tab 键的空格数
vim.opt.expandtab = true   -- 将 Tab 转换为空格
vim.opt.smartindent = true -- 智能缩进

-- 搜索设置
vim.opt.hlsearch = true   -- 高亮搜索结果
vim.opt.ignorecase = true -- 忽略大小写
vim.opt.smartcase = true  -- 大写字母时区分大小写

-- 其他实用设置
vim.opt.cursorline = true -- 高亮当前行
vim.opt.autoread = true   -- 自动读取外部修改的文件
vim.opt.mouse = "a"       -- 启用鼠标支持
vim.opt.wrap = false      -- 不自动换行
