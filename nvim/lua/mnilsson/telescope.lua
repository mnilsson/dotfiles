local loaded, telescope = pcall(require, "telescope")

if not loaded then
  return
end

local config = {}

telescope.setup(config)
telescope.load_extension('projects')





