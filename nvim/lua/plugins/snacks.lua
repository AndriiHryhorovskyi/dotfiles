return {
  "folke/snacks.nvim",
  opts = {
    scratch = { enabled = false },
    terminal = { enabled = false },
    dashboard = { enabled = false },
    gh = { enabled = false },
    gitbrowse = { enabled = false },

    input = {
      enabled = true,
      icon = "",
      expand = true,
      win = {
        relative = "cursor",
        row = -3,
        col = 0,
        width = 0,
        wo = {
          winhighlight = "",
        },
      },
    },

    notifier = {
      top_down = false, -- place notifications from top to bottom
      timeout = 7000,
    },

    picker = {
      sources = {
        explorer = {
          layout = { layout = {
            position = "left",
            width = 0.18,
          } },
        },
      },
      win = {
        input = {
          keys = {
            ["<c-u>"] = { "list_scroll_up", mode = { "n" } },
            ["<c-j>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<c-k>"] = { "preview_scroll_up", mode = { "i", "n" } },
          },
        },
      },
    },
  },

  keys = {
    { "<leader>e", false },
    { "<leader>,", false },
    { "<leader><space>", false },
    { "<leader>fe", false },
    { "<leader>E", false },
    { "<leader>fE", false },
    { "<leader>sr", false },
    { "<leader>sR", false },
    { "<leader>sB", false },
    { "<leader>sb", false },
    { "<leader>fb", false },
    { "<leader>fB", false },
    { "<leader>fc", false },
    { "<leader>ff", false },
    { "<leader>fF", false },
    { "<leader>fg", false },
    { "<leader>fr", false },
    { "<leader>fR", false },
    { "<leader>fp", false },
    { "<leader>gi", false },
    { "<leader>gI", false },
    { "<leader>gp", false },
    { "<leader>gP", false },
    { "<leader>gb", false },
    { "<leader>gB", false },
    { "<leader>gd", false },
    { "<leader>gD", false },
    { "<leader>gf", false },
    { "<leader>gl", false },
    { "<leader>gL", false },
    { "<leader>gS", false },
    { "<leader>gs", false },
    {
      "<leader>sp",
      function()
        Snacks.picker.pickers()
      end,
      desc = "Picker",
    },

    {
      "\\",
      function()
        Snacks.explorer()
      end,
      desc = "Open explorer",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.lines()
      end,
      desc = "Fuzzy search in current buffer",
    },
  },
}
