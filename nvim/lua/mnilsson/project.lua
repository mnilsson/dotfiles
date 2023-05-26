
local loaded, project = pcall(require, "project_nvim")

if not loaded then
  return
end

project.setup {
}
