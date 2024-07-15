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
      return {
        adapters = {
          neotest_gtest,
        },
      }
    end,
    config = function(_, opts)
      require("neotest").setup(opts)
    end,
  },
}
