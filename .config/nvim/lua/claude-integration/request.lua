local M = {}

local function parse_claude_response(json_str)
  -- Load json response
  local success, parsed = pcall(vim.json.decode, json_str)
  if not success then
    return "Error parsing JSON response"
  end

  -- Extract text content
  if parsed.content and parsed.content[1] and parsed.content[1].text then
    return parsed.content[1].text
  end

  return "No content found in response"
end

local function get_curl_command(prompt, api_key)
  -- Fix JSON escaping
  local escaped_text = prompt:gsub("\\", "\\\\"):gsub('"', '\\"'):gsub("\n", "\\n"):gsub("'", "'\\''")

  local curl_cmd = string.format(
    [[
        curl -X POST https://api.anthropic.com/v1/messages \
        -H "x-api-key: %s" \
        -H "anthropic-version: 2023-06-01" \
        -H "content-type: application/json" \
        -d '{
            "model": "claude-3-5-sonnet-20241022",
            "max_tokens": 1000,
            "temperature": 0,
            "messages": [
                {
                    "role": "user",
                    "content": "%s"
                }
            ],
			"system": "Provide concise responses while maintaining accuracy and helpfulness."
        }']],
    api_key,
    escaped_text
  )

  return curl_cmd
end

M.make_request = function(prompt, api_key)
  local output = {}
  local curl_cmd = get_curl_command(prompt, api_key)
  local loading = require("claude-integration.loading").show_loading_animation()

  vim.fn.jobstart(curl_cmd, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data and data[1] ~= "" then
        output = data
      end
    end,
    on_exit = function()
      loading.timer:stop()
      loading.timer:close()
      if #output > 0 then
        local response = table.concat(output)
        local content = parse_claude_response(response)

        require("claude-integration.history").log_api_call(prompt, content)
        vim.api.nvim_buf_set_lines(loading.buf, 0, -1, false, vim.split(content, "\n"))
      else
        vim.api.nvim_win_close(loading.win, true)
      end
    end,
  })
end

M.make_request_visual = function(prefix, api_key)
  local s_start = vim.fn.getpos "'<"
  local s_end = vim.fn.getpos "'>"
  local lines = vim.fn.getline(s_start[2], s_end[2])

  if #lines == 0 then
    return
  end

  lines[1] = string.sub(lines[1], s_start[3], -1)
  if #lines > 1 then
    lines[#lines] = string.sub(lines[#lines], 1, s_end[3])
  else
    lines[1] = string.sub(lines[1], 1, s_end[3])
  end

  local selected_text = table.concat(lines, "\n")
  local text = prefix and (prefix .. "\n\n" .. selected_text) or selected_text
  M.make_request(text, api_key)
end

return M
