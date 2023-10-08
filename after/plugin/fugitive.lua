-- git push
vim.keymap.set("n", "<leader>gp", ":Git push<Enter>")

-- git status
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- view diff in vertical split
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<Enter>")
