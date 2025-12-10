return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000, -- Ensure it loads before everything else
        config = function()
            -- Your original setup code goes here
            require("catppuccin").setup {
                color_overrides = {
                    all = {
                        base = "#000000",
                    },
                }
            }

            -- Set the scheme
            vim.cmd.colorscheme("catppuccin-mocha")
        end
    }
}