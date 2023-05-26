require('nvim-treesitter.configs').setup {
  ensure_installed = { "norg", --[[ other parsers you would wish to have ]] },
  highlight = { -- Be sure to enable highlights if you haven't!
  enable = true,
  }
}
