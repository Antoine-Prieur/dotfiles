vim.api.nvim_create_user_command("AskClaude", function()
  require("claude-integration").make_request_input()
end, {})

vim.api.nvim_create_user_command("AskClaudeVisual", function()
  require("claude-integration").make_request_input_visual()
end, {})
