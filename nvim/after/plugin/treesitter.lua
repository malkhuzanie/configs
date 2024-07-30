require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "rust", "lua", "sql", "c_sharp" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true
    }
}
