return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>y", mode = { "n", "v" }, group = "yank to clipboard" },
        { "<leader>d", mode = { "n", "v" }, group = "delete to black hole" },
        { "<leader>gc", mode = "n", group = "commit" },
        { "<leader>gl", mode = "n", group = "log" },
        { "<leader>gS", mode = "n", group = "Stash" },
        { "<leader>gb", mode = "n", group = "branch" },
        { "<leader>gd", mode = "n", group = "diff" },
        { "<leader>cT", mode = "n", group = "Tasks" },
        { "<leader>ct", mode = "n", group = "test" },
      },
    },
  },
}
