vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.guicursor = ""
vim.opt.mouse = ""
vim.g.mapleader = " "

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 16
vim.opt.scrollback = -1
vim.opt.encoding = "utf-8"

vim.cmd [[
    autocmd FileType c, cpp, h set equalprg=clang-format\ -style="{google, IndentWidth: 4, TabWidth=4}"
]]

-- neovide configs
if vim.g.neovide then
    -- vim.g.neovide_fullscreen = false
    -- vim.g.neovide_remember_window_size = true

    -- vim.o.guifont='DejaVu Sans Mono:Light::h15'
    vim.o.guifont='IntelOne Mono Light:h15'
    -- vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})

    vim.g.neovide_cursor_animation_length = 0
end

