function SetColors(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)
end

return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        opts = {},
        config = function ()
            SetColors()
        end
    }
}
