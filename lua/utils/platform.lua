local platform = {}

-- os helper functions
platform.is_windows = function()
    return vim.loop.os_uname().sysname:find("Windows") ~= nil
end

platform.is_linux = function()
    return vim.loop.os_uname().sysname == "Linux"
end

platform.is_macos = function()
    return vim.loop.os_uname().sysname == "Darwin"
end

return platform
