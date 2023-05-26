local load_ok, rt = pcall(require, "rust-tools")

if not load_ok then
 return
end


rt.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, {buffer = bufnr})
      vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, {buffer = bufnr})

    end
  }

})
