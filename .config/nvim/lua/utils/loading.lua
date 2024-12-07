local M = {}

M.response_win = nil -- Store window reference

function M.show_loading_animation()
  local loading_buf = vim.api.nvim_create_buf(false, true)

  if not M.response_win or not vim.api.nvim_win_is_valid(M.response_win) then
    vim.cmd "vsplit"
    local width = math.floor(vim.o.columns / 3)
    vim.cmd("vertical resize " .. width)
    M.response_win = vim.api.nvim_get_current_win()
  end

  vim.api.nvim_win_set_buf(M.response_win, loading_buf)

  local frames = { "|", "/", "-", "\\" }
  local frame_idx = 1
  local timer = vim.loop.new_timer()

  timer:start(
    0,
    100,
    vim.schedule_wrap(function()
      vim.api.nvim_buf_set_lines(loading_buf, 0, -1, false, { "Loading " .. frames[frame_idx] })
      frame_idx = (frame_idx % #frames) + 1
    end)
  )

  return {
    timer = timer,
    buf = loading_buf,
    win = M.response_win,
  }
end

return M
