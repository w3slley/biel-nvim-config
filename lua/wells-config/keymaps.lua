-- Easier way to go to Explorer (:Ex)
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- Move highlighted lines up or down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quickly navigating windows
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>h", "<C-w>h")

-- Quickly windows split
vim.keymap.set("n", "<leader>b", "<C-w>s")
vim.keymap.set("n", "<leader>v", "<C-w>v")

-- LazyGit
vim.keymap.set("n", "<leader>gg", [[:LazyGit<CR>]])

-- Map for clearing search highlight
vim.keymap.set("n", "<ESC>", [[:noh<CR>]], { silent = true })
