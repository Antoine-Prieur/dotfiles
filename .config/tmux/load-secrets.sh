#!/bin/bash

SESSION_ID=$(tmux display-message -p '#S')

tmux setenv -t "$SESSION_ID" ANTHROPIC_API_KEY "$(pass show api/anthropic)"
tmux setenv -t "$SESSION_ID" GITLAB_TOKEN "$(pass show api/gitlab)"

tmux display-message "Secrets loaded for session $SESSION_ID"
