-- settings for markdown-preview.nvim
vim.g.mkdp_auto_close = 0
vim.g.mkdp_refresh_slow = 1
vim.g.mkdp_markdown_css = vim.fn.stdpath("config") .. "/lua/plugins/markdown/markdown-preview.css"

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      enabled = true,
      render_modes = true,
      quote = { repeat_linebreak = true },
      heading = {
        sign = false,
      },
      win_options = {
        showbreak = { default = "", rendered = "  " },
        breakindent = { default = false, rendered = true },
        breakindentopt = { default = "", rendered = "" },
      },
      html = {
        enabled = true,
        comment = {
          conceal = false,
        },
      },
      latex = {
        enabled = true,
      },
    },
  },
  {
    "AckslD/nvim-FeMaco.lua",
    ft = { "markdown" },
    opts = {},
    keys = {
      { "<leader>ce", "<cmd>FeMaco<cr>", mode = "n", desc = "edit" },
    },
  },
}
