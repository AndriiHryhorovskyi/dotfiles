return {
  {
    "selimacerbas/mdkite.nvim",
    -- a kitehost.nvim checkout under another dir name needs its spec to
    -- say name = "kitehost.nvim", or lazy.nvim clones upstream beside it
    dependencies = { { "selimacerbas/kitehost.nvim", lazy = true } },
    -- kitehost.nvim v2.0.0 or newer, the first release with its Host check
    config = function()
      require("mdkite").setup({
        -- all optional; sane defaults shown
        instance_mode = "multi", -- "takeover" (one tab) or "multi" (tab per instance)
        port = 0, -- 0 = auto (8421 for takeover, OS-assigned for multi)
        open_browser = true,
        default_theme = "dark", -- "dark" or "light"; initial preview theme
        debounce_ms = 500,
        custom_css = vim.fn.stdpath("config") .. "/lua/plugins/markdown/mdkite.css",
      })
    end,
    ft = { "markdown" },
    keys = {
      { "<leader>cp", "<cmd>MdKite toggle<cr>", mode = "n", desc = "preview markdown" },
    },
  },
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
