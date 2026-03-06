return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
        end

      -- stylua: ignore start
      map("n", "]h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end, "Next Hunk")
      map("n", "[h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end, "Prev Hunk")
      map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
      map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
      map({ "n", "x" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({ "n", "x" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>ghU", gs.reset_buffer_index, "Undo Stage Buffer")
      map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
      map("n", "<leader>ghP", gs.preview_hunk_inline, "Preview Hunk Inline")
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer")
      map("n", "<leader>ghd", gs.diffthis, "Diff against index")
      map("n", "<leader>ghD", function() gs.diffthis("@") end, "Diff against @")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "sindrets/diffview.nvim", opts = { view = { merge_tool = { layout = "diff3_mixed" } } } },
      "folke/snacks.nvim",
    },
    opts = {
      -- "ascii"   is the graph the git CLI generates
      -- "unicode" is the graph like https://github.com/rbong/vim-flog
      -- "kitty"   is the graph like https://github.com/isakbm/gitgraph.nvim - use https://github.com/rbong/flog-symbols if you don't use Kitty
      graph_style = "kitty",
      -- Disable line numbers and relative line numbers
      disable_line_numbers = false,
      disable_relative_line_numbers = false,
      -- Show message with spinning animation when a git command is running.
      process_spinner = false,
      integrations = {
        telescope = nil,
      },
      mappings = {
        status = {
          ["<c-S>"] = "StageAll",
          ["<c-s>"] = "SplitOpen",
        },
      },
    },
    keys = {
      {
        "<leader>gs",
        function()
          require("neogit").open()
        end,
        mode = { "n" },
        desc = "status",
        noremap = true,
      },
      {
        "<leader>gSp",
        "<CMD>!git stash -u -q<CR><CR>",
        mode = { "n" },
        desc = "push",
      },
      {
        "<leader>gSP",
        "<CMD>!git stash pop -q<CR><CR>",
        mode = { "n" },
        desc = "Pop",
      },
      {
        "<leader>gca",
        function()
          vim.cmd("silent !git add -A")
          require("neogit").action("commit", "commit", { "--verbose" })()
        end,
        mode = { "n" },
        desc = "all",
      },
      {
        "<leader>gcA",
        function()
          vim.cmd("silent !git add -A")
          require("neogit").action("commit", "amend", { "--verbose" })()
        end,
        mode = { "n" },
        desc = "Amend",
      },
      {
        "<leader>gf",
        function()
          require("neogit").action("fetch", "fetch_pushremote")()
        end,
        mode = { "n" },
        desc = "fetch",
      },
      {
        "<leader>gbc",
        function()
          local reloadGroup = vim.api.nvim_create_augroup("refresh", { clear = true })
          vim.api.nvim_create_autocmd({ "User" }, {
            pattern = "NeogitBranchCheckout",
            group = reloadGroup,
            desc = "Refresh current buffer after checkout branch",
            callback = function()
              vim.cmd.checkt()
              vim.api.nvim_clear_autocmds({ group = reloadGroup })
            end,
          })
          require("neogit").action("branch", "checkout_local_branch")()
        end,
        mode = { "n" },
        desc = "chechout",
      },
      {
        "<leader>gp",
        function()
          require("neogit").action("pull", "from_upstream")()
        end,
        mode = { "n" },
        desc = "pull",
      },
      {
        "<leader>gP",
        function()
          require("neogit").action("push", "to_upstream")()
        end,
        mode = { "n" },
        desc = "Push",
      },
      {
        "<leader>gl",
        function()
          local file = vim.fn.expand("%")
          vim.cmd([[execute "normal! \<ESC>"]])
          local line_start = vim.fn.getpos("'<")[2]
          local line_end = vim.fn.getpos("'>")[2]
          require("neogit").action("log", "log_current", { "-L" .. line_start .. "," .. line_end .. ":" .. file })()
        end,
        desc = "line range",
        mode = "v",
      },
      {
        "<leader>glf",
        function()
          local file = vim.fn.expand("%")
          require("neogit").action("log", "log_current", { "--graph", "--decorate", "--", file })()
        end,
        desc = "current file",
      },
      {
        "<leader>glb",
        function()
          require("neogit").action("log", "log_current", { "--decorate" })()
        end,
        desc = "current branch",
      },
      {
        "<leader>glB",
        function()
          require("neogit").action("log", "log_other", { "--decorate" })()
        end,
        desc = "a Branch",
      },
      {
        "<leader>gla",
        function()
          require("neogit").action("log", "log_all_references", { "--graph", "--decorate" })()
        end,
        desc = "all branches",
      },
      {
        "<leader>gdw",
        function()
          vim.cmd("silent DiffviewOpen")
        end,
        desc = "workdir",
      },
      {
        "<leader>gdf",
        function()
          local file = vim.fn.expand("%")
          vim.cmd("silent DiffviewOpen -- " .. file)
          vim.cmd("silent DiffviewToggleFiles")
        end,
        desc = "current file",
      },
      {
        "<leader>gdq",
        function()
          vim.cmd("silent DiffviewClose")
        end,
        desc = "quit",
      },
    },
  },
}
