return {
  "AckslD/nvim-neoclip.lua",
  dependencies = { "nvim-telescope/telescope.nvim" },
  lazy = false,
  opts = {
    keys = {
      telescope = {
        i = {
          paste = "<C-S-P>",
          paste_behind = "<C-S-K>",
        },
      },
    },
  },
  keys = {
    {
      "<leader>sy",
      mode = { "n" },
      "<cmd>Telescope neoclip<CR>",
      desc = "Yanked",
    },
  },
}
