-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true
-- Insert indents automatically
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
-- Don't ignore case with capitals
vim.opt.smartcase = true

-- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.signcolumn = "yes"

-- Save swap file and trigger CursorHold
vim.opt.updatetime = 200

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣", --[[ space = '·'  ]]
}

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true
-- Show which column your cursor is on
vim.opt.cursorcolumn = true
vim.opt.colorcolumn = "100"

vim.opt.modelines = 1

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 0

-- Set highlight on search
vim.opt.hlsearch = true

-- Maximum number of entries in a popup
vim.opt.pumheight = 10

-- Number of spaces tabs count for
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
-- Size of an indent
vim.opt.shiftwidth = 0
-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Set terminal tab title
vim.opt.title = true

vim.opt.wrap = true

vim.opt.clipboard = ""

-- [[ LazyVim options ]]

-- LazyVim auto format
vim.g.autoformat = false

-- Snacks animations
-- Set to `false` to globally disable all snacks animations
vim.g.snacks_animate = false

-- Snacks indent lines
vim.g.snacks_indent = false

-- Disable completion ghost_text
vim.g.ai_cmp = false
