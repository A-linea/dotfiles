return {
    "nvim-lualine/lualine.nvim",
     lazy = false,
  dependencies = {
    'arkav/lualine-lsp-progress',
    'nvim-tree/nvim-web-devicons',
  },
    config = function()
        require("lualine").setup()
    end
}
