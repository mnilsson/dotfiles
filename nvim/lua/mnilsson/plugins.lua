
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {border = "rounded" }
    end,
  },
}

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-vsnip',

    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip' -- Snippets plugin
  }

  -- themes and schemes
  use { "folke/tokyonight.nvim" }

  use { 'kyazdani42/nvim-web-devicons', "kyazdani42/nvim-tree.lua" }

  use { 'nvim-lualine/lualine.nvim' }

  use { 'akinsho/bufferline.nvim' }
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
    end,
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    "nvim-neorg/neorg",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.norg.concealer"] = {},
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                work = "~/notes/work",
                home = "~/notes/home",
              }
            }
          }
        }
      }
    end,
    requires = "nvim-lua/plenary.nvim"
  }

  use { 'numToStr/Comment.nvim'}

  use { "ahmedkhalf/project.nvim" }

  use { 'simrat39/rust-tools.nvim' }

  use {"mfussenegger/nvim-dap","rcarriga/nvim-dap-ui","ravenxrz/DAPInstall.nvim"}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
