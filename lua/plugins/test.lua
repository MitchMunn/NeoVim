return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "alfaix/neotest-gtest",
    },
    opts = function()
      local neotest_gtest = require("neotest-gtest")
      neotest_gtest.setup({
        -- Specify the Gtest binary path here
        gtest_binary = "~/digiloupe/out/build/tests",
      })
      return {
        adapters = {
          neotest_gtest,
        },
      }
    end,
    config = function(_, opts)
      require("neotest").setup(opts)
      vim.cmd([[
        command! -nargs=0 ConfigureGtest lua require("neotest-gtest").configure()
        ]])
    end,
  },
}
