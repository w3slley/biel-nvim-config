require("nvim-treesitter.configs").setup({
  autotag = {
    enable = true
  },
  ensured_installed = {
    "lua",
    "go",
    "svelte"
  },
  highlight = {
    enable = true,
  }
})
