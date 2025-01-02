local dap = require('dap')
dap.adapters.go = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}
dap.adapters.goremote = {
type = "server",
host = "127.0.0.1",
port = 4000,
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "go",
    name = "Debug package",
    request = "launch",
    program = "${fileDirname}"
  },
  {
    type = "go",
    name = "Debug test",
    request = "launch",
    mode = "test",
    program = "${fileDirname}"
  },
  -- works with go.mod packages and sub packages
  {
    type = "go",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  },
  {
    type = "goremote",
    request = "attach",
    mode = "remote",
    name = "Remote debugger",
    cwd = vim.fn.getcwd(),
    substitutePath = {
        {
            from = "/go/src/github.com/carousell",
            to = "/Users/benheng/dev",
        },
        {
            from = "/Users/benheng/dev",
            to = "/go/src/github.com/carousell",
        },
    },
  }
}

-- DAP user interface configuration
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})

-- Start dap-ui automatically when a debug session is started
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Highlighting overrides
-- nvim-dap-ui only sets `guifg=?`, which doesn't work when vim is run in a
-- terminal without `:set termguicolors`. For 256 color terminals we should set
-- `ctermfg` instead. However I'll instead just link each highlighting group to
-- a highlighting group from my colorscheme.
-- vim.cmd("hi! link DapUIScope Normal")
-- vim.cmd("hi! link DapUIVariable Statement")
-- vim.cmd("hi! link DapUIType Type")
-- vim.cmd("hi! link DapUIDecoration Normal")
-- vim.cmd("hi! link DapUIThread Type")
-- vim.cmd("hi! link DapUIStoppedThread Type")
-- vim.cmd("hi! link DapUIFrameName Normal")
-- vim.cmd("hi! link DapUISource Function")
-- vim.cmd("hi! link DapUILineNumber Constant")
-- vim.cmd("hi! link DapUIFloatBorder Normal")
-- vim.cmd("hi! link DapUIWatchesHeader Normal")
-- vim.cmd("hi! link DapUIWatchesEmpty Normal")
-- vim.cmd("hi! link DapUIWatchesValue Normal")
-- vim.cmd("hi! link DapUIWatchesError Normal")
-- vim.cmd("hi! link DapUIWatchesFrame Normal")
-- vim.cmd("hi! link DapUIWatchesFrame Normal")
-- vim.cmd("hi! link DapUIBreakpointsPath Function")
-- vim.cmd("hi! link DapUIBreakpointsInfo Normal")
-- vim.cmd("hi! link DapUIBreakpointsCurrentLine Title")
-- vim.cmd("hi! link DapUIBreakpointsLine DapUILineNumber")
-- vim.cmd("hi! link DapUIBreakpointsDisabledLine DapUILineNumber")

vim.cmd("hi! link DapUIScope Normal")
vim.cmd("hi! link DapUIVariable Statement")
vim.cmd("hi! link DapUIType Type")
vim.cmd("hi! link DapUIDecoration Normal")
vim.cmd("hi! link DapUIThread Type")
vim.cmd("hi! link DapUIStoppedThread Type")
vim.cmd("hi! link DapUIFrameName Normal")
vim.cmd("hi! link DapUISource Function")
vim.cmd("hi! link DapUILineNumber Constant")
vim.cmd("hi! link DapUIFloatBorder Normal")
vim.cmd("hi! link DapUIWatchesHeader Normal")
vim.cmd("hi! link DapUIWatchesEmpty Normal")
vim.cmd("hi! link DapUIWatchesValue Normal")
vim.cmd("hi! link DapUIWatchesError Normal")
vim.cmd("hi! link DapUIWatchesFrame Normal")
vim.cmd("hi! link DapUIWatchesFrame Normal")
vim.cmd("hi! link DapUIBreakpointsPath Function")
vim.cmd("hi! link DapUIBreakpointsInfo Normal")
vim.cmd("hi! link DapUIBreakpointsCurrentLine Title")
vim.cmd("hi! link DapUIBreakpointsLine DapUILineNumber")
vim.cmd("hi! link DapUIBreakpointsDisabledLine DapUILineNumber")
