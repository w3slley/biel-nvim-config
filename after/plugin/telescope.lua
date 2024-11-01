--Telescope
--
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then return tail end
  return string.format("%s\t\t%s", tail, parent)
end

local function getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ''
  end
end

local builtin = require('telescope.builtin')
require('telescope').setup({
  pickers = {
    find_files = {
      path_display = filenameFirst,
      previewer = false
    },
    live_grep = {
      path_display = filenameFirst,
    },
    grep_string = {
      path_display = filenameFirst,
    }
  },
  defaults = {
    file_ignore_patterns = {
      "node_modules"
    },
  }
})

require("telescope").load_extension("git_worktree")

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('v', '<C-f>', function()
  local text = getVisualSelection()
  builtin.live_grep({ default_text = text })
end, { noremap = true, silent = true })

-- Git worktree shortcuts
vim.keymap.set('n', '<C-l>', [[:lua require('telescope').extensions.git_worktree.git_worktrees()<CR>]])
vim.keymap.set('n', '<C-c>', [[:lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>]])
