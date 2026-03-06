return {
  "nvim-telescope/telescope.nvim",
  version = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>sT",
      function()
        require("telescope.builtin").filetypes()
      end,
      desc = "File[T]ypes (to set)",
    },
  },
}
