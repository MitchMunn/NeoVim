return {
  {
    "mbbill/undotree",
    keys = {
      {
        "<leader>uU",
        ":UndotreeToggle<CR>",
        desc = "Visualise Undotree",
      },
    },
    config = function(_, opts)
      -- Apply the options using vim.g
      vim.g.undotree_SplitWidth = opts.undotree_SplitWidth or 20
      vim.g.undotree_DiffpanelHeight = opts.undotree_DiffpanelHeight or 10
      vim.g.undotree_WindowLayout = opts.undotree_WindowLayout or 2
    end,
    opts = {
      undotree_SplitWidth = 10, -- Set the width of the undotree window
      undotree_DiffpanelHeight = 10, -- Set the height of the diff panel
      undotree_WindowLayout = 2, -- Set the layout of the undotree window (optional)
    },
  },
}
