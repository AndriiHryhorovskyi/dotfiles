return {
  "nvim-neotest/neotest",
  dependencies = {
    -- testing framework adapters
    "nvim-neotest/neotest-jest",
  },
  opts = {
    -- Can be a list of adapters like what neotest expects,
    -- or a list of adapter names,
    -- or a table of adapter names, mapped to adapter configs.
    -- The adapter will then be automatically loaded with the config.
    adapters = {
      ["neotest-jest"] = {
        jestCommand = "npm test --",
        jestConfigFile = "jest.config.js",
        env = { CI = true },
        cwd = function(path)
          return vim.fn.getcwd()
        end,
      },
    },
  },
  keys = {
    { "<leader>ta", false },
    { "<leader>tt", false },
    { "<leader>tT", false },
    { "<leader>tr", false },
    { "<leader>tl", false },
    { "<leader>ts", false },
    { "<leader>to", false },
    { "<leader>tO", false },
    { "<leader>tS", false },
    { "<leader>tw", false },

    {
      "<leader>ctf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run test [f]ile",
    },
    {
      "<leader>ctF",
      function()
        require("neotest").run.run(vim.uv.cwd())
      end,
      desc = "Run all test [F]iles",
    },
    {
      "<leader>ctt",
      function()
        require("neotest").run.run()
      end,
      desc = "run nearest test",
    },
    {
      "<leader>ctl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "run last test",
    },
    -- {
    --   "<leader>ctd",
    --   function()
    --     require("neotest").run.run({ strategy = "dap" })
    --   end,
    --   desc = "Debug nearest test",
    -- },
    {
      "<leader>cto",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "open panel toggle",
    },
    {
      "<leader>cts",
      function()
        require("neotest").output.open({ enter = false, short = true, auto_close = true })
      end,
      desc = "show short output",
    },
    {
      "<leader>ctS",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Show full output",
    },
    {
      "<leader>ctq",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop/quit Neotest",
    },
    {
      "<leader>ctw",
      function()
        require("neotest").watch.toggle(vim.fn.expand("%"))
      end,
      desc = "watch mode toggle",
    },
  },
}
