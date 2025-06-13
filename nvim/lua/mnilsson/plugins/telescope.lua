eturn {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build ='make',
            cond=function()
                return vim.fn.executable 'make' == 1
            end
        },
        {'nvim-telescope/telescope-ui-select.nvim'},
        {'nvim-tree/nvim-web-devicons',enabled=vim.g.have_nerd_font}
    },
    config = function()
        require('telescope').setup({
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                }
            }
        })

        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>sf',builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader><leader>',builtin.buffers, {desc = '[ ]Find existing buffers'})
    end
}
