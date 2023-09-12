local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then 
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  "wbthomason/packer.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",

  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-vsnip",

  "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
  "L3MON4D3/LuaSnip", -- Snippets plugin


  "folke/tokyonight.nvim",

  {
    "kyazdani42/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function () 
      require("nvim-tree").setup {
        
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        }
      }
    end
  },

  "nvim-lualine/lualine.nvim",

  "akinsho/bufferline.nvim",


  'numtostr/comment.nvim',

  "ahmedkhalf/project.nvim",

  'simrat39/rust-tools.nvim',

  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "ravenxrz/dapinstall.nvim",
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
    end,
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true }) 
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.esupports.metagen"] = { config = { type = "auto", update_date = true } },
          ["core.qol.toc"] = {},
          ["core.qol.todo_items"] = {},
          ["core.looking-glass"] = {},
          ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
          ["core.journal"] = {
            config = {
              strategy = "flat",
              workspace = "Notes",
            },
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                work = "~/projects/mnilsson/notes/work",
                home = "~/projects/mnilsson/notes/home",
              }
            }
          },
          ["core.keybinds"] = {
            config = {
              default_keybinds = true,
              neorg_leader = "<Leader><Leader>",
            },
          },
        }
      }
    end,
  }
})



