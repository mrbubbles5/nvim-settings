return {
  {"neovim/nvim-lspconfig"},
  -- Rust tools
  { "mfussenegger/nvim-dap" }, -- Debug Adapter Protocol (DAP) for debugging
  { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } }, -- Debug UI
  { "nvim-neotest/nvim-nio" }, -- Ensure nvim-nio is installed
  { "neovim/nvim-lspconfig" }, -- LSP support
  { "williamboman/mason.nvim" }, -- LSP/DAP manager
  { "williamboman/mason-lspconfig.nvim" }, -- Integration for Mason & LSPConfig
  { "simrat39/rust-tools.nvim" }, -- Enhanced Rust support
  { "nvim-lua/plenary.nvim" }, -- Required dependency
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- Fuzzy finder
}

