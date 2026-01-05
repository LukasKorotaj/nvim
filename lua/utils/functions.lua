local M = {}

function M.diagwin(min_severity)
  local editor_width = vim.o.columns
  local win_width = math.floor(editor_width * 0.3)
  local win_height = math.floor(vim.o.lines * 0.3)

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
