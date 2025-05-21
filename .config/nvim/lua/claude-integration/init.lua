local M = {}

local api_key = vim.env.ANTHROPIC_API_KEY

M.make_request_input = function()
  local prompt = vim.fn.input "Enter prompt: "
  if prompt ~= "" then
    require("claude-integration.request").make_request(prompt, api_key)
  end
end

M.make_request_input_visual = function()
  local prompt = vim.fn.input "Enter prompt: "
  if prompt ~= "" then
    require("claude-integration.request").make_request_visual(prompt, api_key)
  end
end

-- Create custom commands
vim.api.nvim_create_user_command("AskAIAssistant", function()
  require("claude-integration").make_request_input()
end, {})

vim.api.nvim_create_user_command("AskAIAssistantVisual", function()
  require("claude-integration").make_request_input_visual()
end, {})

-- Setup telescope
require("claude-integration.history").setup_telescope()

return M
