return {
  {
    "jiangmiao/auto-pairs",
    init = function()
      vim.g.AutoPairsFlyMode = 1
      vim.g.AutoPairsMapBS = 1
      vim.g.AutoPairsMapCh = 1
      vim.g.AutoPairsMapCR = 0
      vim.g.AutoPairsCenterLine = 1
      vim.g.AutoPairsMapSpace = 1
      vim.g.AutoPairsMultilineClose = 1
      vim.g.AutoPairsShortcutBackInsert = "<C-b>"
      vim.g.AutoPairsShortcutJump = "<S-Tab>"
      -- vim.g.AutoPairsShortcutToggle = "<C-p>"
      vim.g.AutoPairsShortcutFastWrap = "<C-e>"
    end,
    config = function()
      -- Створюємо мапінг через функцію
      vim.keymap.set("i", "<CR>", function()
        local cmp = package.loaded["cmp"]
        if cmp and cmp.visible() then
          return vim.api.nvim_replace_termcodes("<CR>", true, true, true)
        end
        return vim.api.nvim_replace_termcodes("<CR><C-R>=AutoPairsReturn()<CR>", true, true, true)
      end, {
        expr = true,
        silent = true,
        desc = "AutoPairs Enter fix",
      })
    end,
  },
}
