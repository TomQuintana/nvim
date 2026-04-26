local M = {}

local function get_nvim_keymaps()
  local lines = { "  NVIM KEYMAPS", "  " .. string.rep("─", 72), "" }
  local keymaps_path = vim.fn.stdpath("config") .. "/lua/milo/keymaps_map.lua"
  local f = io.open(keymaps_path, "r")
  if not f then return lines end

  for line in f:lines() do
    local trimmed = line:match("^%s*(.-)%s*$")
    if trimmed:match("^%-%- ") then
      local section = trimmed:match("^%-%- (.+)$")
      if section and not section:match("^{") then
        table.insert(lines, "")
        table.insert(lines, "  › " .. section)
      end
    elseif trimmed:match("^{%s*key") then
      local key = trimmed:match('key%s*=%s*"([^"]+)"')
      local desc = trimmed:match('desc%s*=%s*"([^"]+)"')
      if key and desc then
        table.insert(lines, string.format("    %-20s  %s", key, desc))
      end
    end
  end
  f:close()
  return lines
end

local function get_kitty_keymaps()
  local kitty_conf = os.getenv("HOME") .. "/.config/kitty/kitty.conf"
  local lines = { "", "  KITTY KEYMAPS", "  " .. string.rep("─", 72), "" }
  local f = io.open(kitty_conf, "r")
  if not f then
    table.insert(lines, "  (kitty.conf not found)")
    return lines
  end

  for line in f:lines() do
    local trimmed = line:match("^%s*(.-)%s*$")
    if trimmed:match("^# ") and #trimmed > 3 then
      local comment = trimmed:match("^#%s+(.+)$")
      if comment and #comment < 60 then
        table.insert(lines, "")
        table.insert(lines, "  › " .. comment)
      end
    elseif trimmed:match("^map ") then
      local rest = trimmed:match("^map%s+(.+)$")
      if rest then
        local key, action = rest:match("^(%S+)%s+(.+)$")
        if key and action then
          table.insert(lines, string.format("    %-28s  %s", key, action))
        end
      end
    end
  end
  f:close()
  return lines
end

function M.open_keymaps_window()
  local lines = {}

  for _, l in ipairs(get_nvim_keymaps()) do
    table.insert(lines, l)
  end
  for _, l in ipairs(get_kitty_keymaps()) do
    table.insert(lines, l)
  end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
  vim.bo[buf].filetype = "text"

  local width = 80
  local height = math.min(40, vim.o.lines - 4)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = " Keymaps ",
    title_pos = "center",
  })

  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
  vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { buffer = buf, silent = true })
end

return M
