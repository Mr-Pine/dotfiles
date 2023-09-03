return {
    "folke/trouble.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    init = function()
        local trouble = require("trouble")

        trouble.setup({
            action_keys = {
                close_folds = { "zc" },
                open_folds = { "zo" },
                toggle_fold = { "zt" },
            },
        })

        vim.keymap.set("n", "T", function() trouble.trouble() end, {silent = true})
    end,
}
