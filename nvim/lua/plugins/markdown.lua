-- settings for markdown-preview.nvim
vim.g.mkdp_auto_close = 0

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      enabled = true,
      quote = { repeat_linebreak = true },
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
}
