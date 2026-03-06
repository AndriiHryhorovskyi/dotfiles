return {
  -- Examples:
  -- [count]gcc        - Toggles the number of line given as a prefix-count using linewise
  -- [count]gbc        - Toggles the number of line given as a prefix-count using blockwise
  -- gc[count]{motion} - Toggles the region using linewise comment
  -- gb[count]{motion} - Toggles the region using blockwise comment
  -- gco               - Insert comment to the next line and enters INSERT mode
  -- gcO               - Insert comment to the previous line and enters INSERT mode
  -- gcA               - Insert comment to end of the current line and enters INSERT mode
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", opts = { enable_autocmd = false } },
    opts = {
      pre_hook = function()
        require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      end,
    },
  },
  {
    "folke/todo-comments.nvim",
    opts = { signs = false },
    keys = {
      { "<leader>sT", false },
    },
  },
}
