local lint = require "lint"
local mypy = lint.linters.mypy

mypy.cmd = pythonPath
mypy.args = {
  "-m",
  "mypy",
  "--strict",
  "--show-column-numbers",
  "--show-error-end",
  "--hide-error-codes",
  "--hide-error-context",
  "--no-color-output",
  "--no-error-summary",
  "--no-pretty",
}
