return {
  "folke/tokyonight.nvim",
  opts = {
    style = "storm",
    on_highlights = function(hl, colors)
      -- hl.LineNr = {
      --   -- fg = colors.yellow,
      --   fg = "#b2b8cf",
      -- }
      -- hl.LineNrAbove = {
      --   -- fg = colors.yellow,
      --   fg = "#b2b8cf",
      -- }
      -- hl.LineNrBelow = {
      --   -- fg = colors.yellow,
      --   fg = "#b2b8cf",
      -- }
      hl.Whitespace = {
        fg = "#b2b8cf",
      }
      hl.SnacksInputTitle = {
        fg = "#29a4bd", -- TokyoNight FloatTitle cyan
        bg = colors.bg_dark,
      }
    end,
  },
}
