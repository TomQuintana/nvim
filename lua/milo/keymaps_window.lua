local M = {}

function M.open_keymaps_window()
  local keymaps_path = vim.fn.stdpath('config') .. '/lua/milo/keymaps_map.lua'
  local file_content = {}
  for line in io.lines(keymaps_path) do
    table.insert(file_content, line)
  end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, file_content)

  local width = 80
  local height = 20
  local row = (vim.o.lines - height) / 2
  local col = (vim.o.columns - width) / 2

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'single',
  })
end

return M
