return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    config = function()
        vim.keymap.set("n", "m", "<cmd>Markview<CR>")
    end,
}
