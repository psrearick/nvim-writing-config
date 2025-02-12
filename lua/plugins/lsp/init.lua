-- LSP configuration entry point

return {
    {
        -- `lazydev` configures Lua LSP for Neovim configs, runtimes and plugins
        -- used for completion, annotations and signatures of Neovim apis
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            'j-hui/fidget.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            -- Initialize Mason first
            require('mason').setup()
            -- Then set up the servers
            require('plugins.lsp.servers').setup()
            -- Finally set up completion
            require('plugins.lsp.completion')
        end,
    },
}
