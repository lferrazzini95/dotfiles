return {
    {
        'nvim-treesitter/nvim-treesitter',
        version = 'v0.9.3',
        run = ':TSUpdate',  -- Update treesitter parsers
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = "all",  -- Install all available parsers
                highlight = {
                    enable = true,  -- Enable highlighting
                },
                -- Additional configuration options can go here
            }
        end,
    },
    -- Add other plugins here
}
