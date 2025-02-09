-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del
map("i", "kj", "<esc><cmd>up<cr>", { desc = "exit inset mode and save file" })
map("n", ";", ":", { desc = "Use semicolon as colon" })
map("n", "<leader>sf", ":so %<CR>", { desc = "Source current file" })

map("n", "<up>", ":close<cr>", { desc = "close current file" })
map("n", "<left>", "<cmd>up!<cr>", { desc = "save current file" })
map("n", "<right>", "<C-w>v", { desc = "Split window vertically" })
map("n", "<down>", "<C-w>s", { desc = "Split window horizontally" })

map("n", "n", "nzzzv", { desc = "next search result and center" })
map("n", "N", "Nzzzv", { desc = "previous search result and center" })
map("n", "<c-d>", "<c-d>zz", { desc = "scroll down half page and center" })
map("n", "<c-u>", "<c-u>zz", { desc = "scroll up half page and center" })
map("n", "<c-f>", "<c-f>zz", { desc = "scroll down full page and center" })
map("n", "<c-b>", "<c-b>zz", { desc = "scroll up full page and center" })

map("n", "<C-]>", "<cmd>cnext<CR>", { desc = "Go to next quickfix item" })
map("n", "<C-[>", "<cmd>cprev<CR>", { desc = "Go to previous quickfix item" })
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all text" })

--WARN: here are the disabled ones.
--
del("n", "<leader>-")
del("n", "<leader>fn")
-- NOTE: here goes custom mappins for creating new external documents
vim.api.nvim_create_user_command("CreateNewNote", function()
  -- Prompt for a custom filename
  local filename = vim.fn.input("Enter note name:", "", "file")

  -- Ensure the filename has a .md extension
  if not filename:match("%.md$") then
    filename = filename .. ".md"
  end

  local filepath = "~/notes/" .. filename
  local expanded_filepath = vim.fn.expand(filepath)

  -- Ensure directory exists
  vim.fn.mkdir(vim.fn.fnamemodify(expanded_filepath, ":h"), "p")

  -- Check if file exists
  if vim.fn.filereadable(expanded_filepath) == 1 then
    -- If the file exists, just open it
    vim.cmd("edit " .. filepath)
  else
    -- If the file doesn't exist, create it
    vim.fn.writefile({}, expanded_filepath, "b")
    vim.cmd("edit " .. filepath)
    -- Add a default line to avoid empty buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, true, { "# New Note" })
  end

  -- Move to end of buffer, insert two new lines, and start insert mode for both cases
  vim.cmd("$ | put _ | put _ | startinsert")
end, {})

vim.keymap.set("n", "<leader>nn", ":CreateNewNote<CR>", { noremap = true, silent = true, desc = "[N]ew [N]ote" })

-- NOTE: create new message
vim.api.nvim_create_user_command("CreateNewMessage", function()
  -- Prompt for a custom filename
  local filename = vim.fn.input("Enter note name:", "", "file")

  -- Ensure the filename has a .md extension
  if not filename:match("%.md$") then
    filename = filename .. ".md"
  end

  local filepath = "~/messages/" .. filename
  local expanded_filepath = vim.fn.expand(filepath)

  -- Ensure directory exists
  vim.fn.mkdir(vim.fn.fnamemodify(expanded_filepath, ":h"), "p")

  -- Check if file exists
  if vim.fn.filereadable(expanded_filepath) == 1 then
    -- If the file exists, just open it
    vim.cmd("edit " .. filepath)
  else
    -- If the file doesn't exist, create it
    vim.fn.writefile({}, expanded_filepath, "b")
    vim.cmd("edit " .. filepath)
    -- Add a default line to avoid empty buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, true, { "# New Note" })
  end

  -- Move to end of buffer, insert two new lines, and start insert mode for both cases
  vim.cmd("$ | put _ | put _ | startinsert")
end, {})

vim.keymap.set("n", "<leader>nm", ":CreateNewMessage<CR>", { noremap = true, silent = true, desc = "[N]ew [M]essage" })
-- journal one
vim.api.nvim_create_user_command("CreateJournal", function()
  local filename = "~/journal/" .. vim.fn.strftime("%d-%m-%Y") .. ".md"
  local expanded_filename = vim.fn.expand(filename)

  -- Ensure directory exists
  vim.fn.mkdir(vim.fn.fnamemodify(expanded_filename, ":h"), "p")

  -- Check if file exists
  if vim.fn.filereadable(expanded_filename) == 1 then
    -- If the file exists, just open it
    vim.cmd("edit " .. filename)
  else
    -- If the file doesn't exist, create it
    vim.fn.writefile({}, expanded_filename, "b")
    vim.cmd("edit " .. filename)
    -- Add a default line to avoid empty buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, true, { "# New Note" })
  end

  -- Move to end of buffer, insert two new lines, and start insert mode for both cases
  vim.cmd("$ | put _ | put _ | startinsert")
end, {})

vim.keymap.set("n", "<leader>nj", ":CreateJournal<CR>", { desc = "[N]ew [J]ournal note" })
