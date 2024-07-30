require("lazy").setup({
    "neovim/nvim-lspconfig",
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp"
    },
    {
        "nvim-telescope/telescope.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-project.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "git@github.com:nvim-treesitter/nvim-treesitter.git"
    },
    "mbbill/undotree",
    {
	    "git@github.com:ThePrimeagen/harpoon.git",
	    branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "funkymcb/nvim-rest-client"
    },
    {
      'nvim-orgmode/orgmode',
      event = 'VeryLazy',
      config = function()
        -- Load treesitter grammar for org
        require('orgmode').setup_ts_grammar()

        -- Setup treesitter
        require('nvim-treesitter.configs').setup({
          highlight = {
            enable = true,
          },
          ensure_installed = { 'org' },
        })

        -- Setup orgmode
        require('orgmode').setup({
          org_agenda_files = '~/orgfiles/**/*',
          org_default_notes_file = '~/orgfiles/refile.org',
        })
      end,
    }
})

