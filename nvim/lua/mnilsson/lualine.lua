
local loaded, lualine = pcall(require, "lualine")

if not loaded then
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto'
  },
  tabline = {}
}
