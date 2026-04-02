-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- [[ Delete default keymaps ]]

-- better up/down
vim.keymap.del({ "n", "x" }, "j")
vim.keymap.del({ "n", "x" }, "k")
vim.keymap.del({ "n", "x" }, "<Down>")
vim.keymap.del({ "n", "x" }, "<Up>")

-- Move Lines
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("v", "<A-k>")

-- buffers
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
vim.keymap.del("n", "[b")
vim.keymap.del("n", "]b")
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>`")

-- save file
vim.keymap.del({ "i", "x", "n", "s" }, "<C-s>")

-- lazy
vim.keymap.del("n", "<leader>l")

-- new file
vim.keymap.del("n", "<leader>fn")

-- toggle options
Snacks.toggle.indent():map("<leader>ug")
vim.keymap.del("n", "<leader>dpp")
vim.keymap.del("n", "<leader>dph")

-- scratch buffers
vim.keymap.del("n", "<leader>dps")
vim.keymap.del("n", "<leader>.")
vim.keymap.del("n", "<leader>S")

-- highlights under cursor
vim.keymap.del("n", "<leader>ui")
vim.keymap.del("n", "<leader>uI")

-- floating terminal
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del({ "n", "t" }, "<c-/>")
vim.keymap.del({ "n", "t" }, "<c-_>")

-- windows
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")

-- Different
vim.keymap.del("n", "<leader>cm")
vim.keymap.del("n", "<leader>cs")
vim.keymap.del("n", "<leader>cS")

-- [[ Set keymaps ]]

-- Yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])

-- Paste from clipboard
vim.keymap.set({ "n" }, "<leader>p", [["+p]], { desc = "Paster from clipboard belove" })
vim.keymap.set({ "n" }, "<leader>P", [["+P]], { desc = "Paster from clipboard above" })

-- Delete to black hole register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>D", [["_D]])

-- Search keymaps
vim.keymap.set({ "n", "x" }, "<leader>sr", function()
  Snacks.picker.resume()
end, { desc = "Resume" })

vim.keymap.set({ "n", "x" }, "<leader>sR", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  grug.open({
    transient = true,
    prefills = {
      filesFilter = ext and ext ~= "" and "*." .. ext or nil,
    },
  })
end, { desc = "Search and Replace" })

vim.keymap.set({ "n" }, "<leader>co", "<cmd>Trouble symbols toggle win={size=40}<cr>", { desc = "Outline (Trouble symbols)" })

vim.keymap.set(
  { "n" },
  "<leader>cO",
  "<cmd>Trouble lsp toggle<cr>",
  { desc = "Keyword under cursor info (Trouble lsp)" }
)

vim.keymap.set({ "n" }, "<leader>sb", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set({ "n" }, "<leader>sN", LazyVim.pick.config_files(), { desc = "Neovim config" })

vim.keymap.set({ "n" }, "<leader>sf", function()
  Snacks.picker.files({ hidden = true, show_empty = true })
end, { desc = "Files" })

vim.keymap.set({ "n" }, "<leader>sF", function()
  Snacks.picker.git_files()
end, { desc = "Git Files" })

vim.keymap.set({ "n" }, "<leader>s.", function()
  Snacks.picker.recent({ filter = { cwd = true } })
end, { desc = "Recent Files (cwd)" })

vim.keymap.set({ "n" }, "<leader>sn", function()
  Snacks.picker.files({ cwd = "~/notes", show_empty = true, title = "Notes" })
end, { desc = "Files" })

-- Treesitter navigation
vim.keymap.set({ "x", "o" }, "a=", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@assignment.outer", "textobjects")
end, { desc = "around assignment" })

vim.keymap.set({ "x", "o" }, "i=", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@assignment.inner", "textobjects")
end, { desc = "inner assignment" })

vim.keymap.set({ "x", "o" }, "as", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
end, { desc = "around local [s]cope" })

vim.keymap.set({ "n", "x", "o" }, "]#", function()
  require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
end, { desc = "next conditional block start" })

vim.keymap.set({ "n", "x", "o" }, "[#", function()
  require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
end, { desc = "previous conditional block start" })

vim.keymap.set({ "n", "x", "o" }, "]s", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
end, { desc = "next scope" })

vim.keymap.set({ "n", "x", "o" }, "[s", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@local.scope", "locals")
end, { desc = "previous scope" })

vim.keymap.set({ "n", "x", "o" }, "]z", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
end, { desc = "next fold" })

vim.keymap.set({ "n", "x", "o" }, "[z", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@fold", "folds")
end, { desc = "previous fold" })

vim.keymap.set({ "n", "x", "o" }, "]=", function()
  require("nvim-treesitter-textobjects.move").goto_next_start({ "@assignment.rhs", "@assignment.lhs" }, "textobjects")
end, { desc = "next assignment start" })

vim.keymap.set({ "n", "x", "o" }, "]=", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start(
    { "@assignment.lhs", "@assignment.rhs" },
    "textobjects"
  )
end, { desc = "previous assignment start" })

vim.keymap.set("n", "<leader>a", function()
  require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
end, { desc = "swap with next arg" })

vim.keymap.set("n", "<leader>A", function()
  require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
end, { desc = "swap with prev arg" })
