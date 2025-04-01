local lspconfig = require("lspconfig")
local rt = require("rust-tools")

-- Rust Tools setup
rt.setup({
  server = {
    on_attach = function(client, bufnr)
      -- Keybindings for Rust LSP
      vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- Mason setup (for managing LSP servers)
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "rust_analyzer" },
  automatic_installation = true,
})

-- Debugging with nvim-dap
local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode", -- Adjust if necessary
  name = "lldb",
}

dap.configurations.rust = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

