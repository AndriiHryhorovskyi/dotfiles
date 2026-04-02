return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    diagnostics = {
      virtual_text = false,
      float = { border = "rounded", source = "if_many" },
    },
    servers = {
      ["*"] = {
        keys = {
          { "<leader>cR", false },
          { "<leader>cr", false },
          { "<leader>cl", false },
          { "<leader>co", false },
          { "[[", false },
          { "]]", false },
          { "<a-n>", false },
          { "<a-p>", false },
          { "<leader>r", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
        },
      },
    },
  },
}
