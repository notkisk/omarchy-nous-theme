local M = {}

local state = {
  active_window = nil,
  images = {},
  group = nil,
}

local programming_filetypes = {
  asm = true,
  bash = true,
  c = true,
  cpp = true,
  css = true,
  fish = true,
  go = true,
  html = true,
  java = true,
  javascript = true,
  javascriptreact = true,
  json = true,
  jsonc = true,
  kotlin = true,
  lua = true,
  make = true,
  markdown = true,
  nix = true,
  php = true,
  python = true,
  ruby = true,
  rust = true,
  sh = true,
  sql = true,
  swift = true,
  terraform = true,
  toml = true,
  typescript = true,
  typescriptreact = true,
  vim = true,
  yaml = true,
  zig = true,
  zsh = true,
}

local function kitty_is_available()
  return vim.env.KITTY_WINDOW_ID ~= nil or vim.env.TERM == "xterm-kitty"
end

local function theme_asset_path()
  local source = debug.getinfo(1, "S").source
  local module_path = source:sub(1, 1) == "@" and source:sub(2) or source
  local theme_dir = vim.fn.fnamemodify(module_path, ":p:h:h:h")
  return theme_dir .. "/assets/nous-research-girl.png"
end

local function valid_window(win)
  return win and vim.api.nvim_win_is_valid(win)
end

local function editor_buffer(win)
  if not valid_window(win) then return false end
  local buf = vim.api.nvim_win_get_buf(win)
  if vim.bo[buf].buftype ~= "" then return false end
  if vim.bo[buf].filetype == "" then return false end
  return programming_filetypes[vim.bo[buf].filetype] == true
end

local function clear_window(win)
  local image = state.images[win]
  if image then
    pcall(image.clear, image, true)
    state.images[win] = nil
  end
  if state.active_window == win then state.active_window = nil end
end

local function clear_all()
  for win in pairs(state.images) do clear_window(win) end
  state.active_window = nil
end

local function dimensions(win)
  local win_width = vim.api.nvim_win_get_width(win)
  local win_height = vim.api.nvim_win_get_height(win)
  if win_width < 92 or win_height < 24 then return nil end

  -- Width is intentionally capped at roughly one quarter of the editor.
  -- image.nvim derives the height from the portrait's aspect ratio.
  local width = math.floor(win_width * 0.24)
  width = math.max(24, math.min(width, 38))
  return {
    x = math.max(0, win_width - width - 3),
    y = math.max(0, vim.api.nvim_win_get_topline(win) - 1),
    width = width,
  }
end

local function draw(win)
  if not valid_window(win) or not kitty_is_available() or not editor_buffer(win) then
    clear_window(win)
    return
  end

  if state.active_window and state.active_window ~= win then clear_window(state.active_window) end

  local geometry = dimensions(win)
  if not geometry then
    clear_window(win)
    return
  end

  local buf = vim.api.nvim_win_get_buf(win)
  local image = state.images[win]
  if not image or image.buffer ~= buf then
    clear_window(win)
    local ok, image_api = pcall(require, "image")
    if not ok then return end
    local path = theme_asset_path()
    if vim.fn.filereadable(path) ~= 1 then return end

    local created, new_image = pcall(image_api.from_file, path, {
      id = ("nous-research-girl:%d:%d"):format(win, buf),
      window = win,
      buffer = buf,
      x = geometry.x,
      y = geometry.y,
      width = geometry.width,
      height = 0,
      inline = false,
    })
    if not created or not new_image then return end
    image = new_image
    state.images[win] = image
  end

  state.active_window = win
  pcall(image.render, image, geometry)
end

local function schedule_draw(win)
  vim.schedule(function()
    if valid_window(win) then draw(win) end
  end)
end

function M.setup()
  if vim.g.nous_research_image == false or vim.env.NOUS_RESEARCH_NVIM_ART == "0" then return end

  state.group = vim.api.nvim_create_augroup("NousResearchImage", { clear = true })

  vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter", "WinEnter", "TabEnter", "FocusGained", "TermLeave" }, {
    group = state.group,
    callback = function(event)
      if event.event == "VimEnter" then
        schedule_draw(vim.api.nvim_get_current_win())
      else
        schedule_draw(event.win or vim.api.nvim_get_current_win())
      end
    end,
  })

  vim.api.nvim_create_autocmd({ "WinScrolled", "WinResized", "VimResized" }, {
    group = state.group,
    callback = function(event)
      local win = event.win and tonumber(event.win) or vim.api.nvim_get_current_win()
      schedule_draw(win)
    end,
  })

  vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave", "FocusLost" }, {
    group = state.group,
    callback = function(event)
      local win = event.win and tonumber(event.win) or vim.api.nvim_get_current_win()
      if event.event == "FocusLost" then
        clear_all()
      else
        clear_window(win)
      end
    end,
  })

  vim.api.nvim_create_autocmd("WinClosed", {
    group = state.group,
    callback = function(event)
      clear_window(tonumber(event.match))
    end,
  })

  vim.api.nvim_create_autocmd("VimLeavePre", {
    group = state.group,
    callback = clear_all,
  })

  schedule_draw(vim.api.nvim_get_current_win())
end

return M
