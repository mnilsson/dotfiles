local dap_loaded, dap = pcall(require, "dap")
if not dap_loaded then
  return
end

local dap_ui_loaded, dapui = pcall(require, "dapui")
if not dap_ui_loaded then
  return
end

local dap_install_loaded, dap_install = pcall(require, "dap-install")
if not dap_install_loaded then
  return
end


dap_install.setup {
  installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
}

dap_install.config("ccppr_vsc", {})
dap_install.config("python", {})


dapui.setup{
  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl= "DiagnosticSignError", linehl = "", numhl = ""})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
