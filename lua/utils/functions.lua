local M = {}

function M.diagwin(min_severity)
  local editor_width = vim.o.columns
  local win_width = math.floor(editor_width * 0.3)
  local win_height = math.floor(vim.o.lines * 0.3)
  local severity = vim.diagnostic.severity

  min_severity = severity[min_severity] or severity.HINT

  -- 3. Open Float with Explicit `pos`
  vim.diagnostic.open_float {
    -- DATA SOURCE: Explicitly target the line we checked
    scope = 'line',
    -- severity = { min = vim.diagnostic.severity.WARN },
    severity = { min = min_severity },

    -- UI / VISUALS
    focusable = false,
    close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
    border = 'rounded',
    prefix = '🤓 ',
    source = 'if_many',
    zindex = 200,

    -- WINDOW POSITIONING (The HUD Logic)
    relative = 'editor',
    offset_x = vim.o.columns,

    max_width = win_width,
    max_height = win_height,
  }
end

local theme_file = vim.fn.stdpath 'config' .. '/lua/config/theme.txt'
function M.apply_theme()
  vim.schedule(function() -- defer to avoid timing issues
    local theme = vim.fn.readfile(theme_file)[1]
    local mode = vim.fn.readfile(theme_file)[2]
    if theme and theme ~= '' then
      vim.o.background = mode
      vim.cmd.colorscheme(theme)
    end
  end)
end

function M.extract_text(data)
  local log = require 'obsidian.log'
  local api = require 'obsidian.api'
  local Note = require 'obsidian.note'

  local viz = api.get_visual_selection()
  if not viz then
    log.err 'Obsidian extract_note must be called with visual selection'
    return
  end

  local content = vim.api.nvim_buf_get_lines(0, viz.csrow - 1, viz.cerow, false)

  -- Parse arguments: expected format is "title mark" or just "mark"
  local title, mark_name
  if data.args ~= nil and string.len(data.args) > 0 then
    local args = vim.split(vim.trim(data.args), '%s+')
    if #args >= 2 then
      title = args[1]
      mark_name = args[2]
    else
      -- Only one argument provided - assume it's the mark name
      mark_name = args[1]
      -- Don't ask for title, let it be auto-generated
    end
  else
    -- No arguments provided - ask for both
    mark_name = api.input 'Enter mark name (single character) to append link: '
    if not mark_name or mark_name == '' then
      log.warn 'No mark provided, aborting'
      return
    end

    title = api.input 'Enter title (optional): '
    if not title then
      log.warn 'Aborted'
      return
    elseif title == '' then
      title = nil
    end
  end

  -- create the new note.
  local note = Note.create { title = title }

  -- Get the mark position
  local mark_pos = vim.api.nvim_buf_get_mark(0, mark_name)
  if mark_pos[1] == 0 and mark_pos[2] == 0 then
    log.err("Mark '" .. mark_name .. "' not found in buffer")
    return
  end

  -- Append link at mark position
  local link = note:format_link()

  vim.api.nvim_buf_set_lines(0, mark_pos[1], mark_pos[1], false, { link })

  require('obsidian.ui').update(0)

  -- add the selected text to the end of the new note
  note:open { sync = true }
  vim.api.nvim_buf_set_lines(0, -1, -1, false, content)
end

return M
