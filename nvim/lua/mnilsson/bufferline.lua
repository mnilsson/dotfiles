local loaded, bufferline = pcall(require, "bufferline")

if not loaded then
  return
end


vim.opt.termguicolors = true
bufferline.setup()
