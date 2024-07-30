local builtin = require('telescope.builtin')
local utils   = require('telescope.utils')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("grep > ") });
end)

-- vim.keymap.set('n', '<leader>ff', function()
--     builtin.find_files({ cwd = utils.buffer_dir() });
-- end)

vim.keymap.set('n', '<leader>ff', function()
    builtin.find_files({ cwd = vim.fn.getcwd() });
end)


