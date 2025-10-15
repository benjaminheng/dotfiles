require('avante_lib').load()
require('avante').setup({
  ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
  provider = "claude", -- Recommend using Claude

  ---@alias Mode "agentic" | "legacy"
  ---@type Mode
  mode = "legacy", -- The default mode for interaction. "agentic" uses tools to automatically generate code, "legacy" uses the old planning method to generate code.

  -- WARNING: Since auto-suggestions are a high-frequency operation and therefore expensive,
  -- currently designating it as `copilot` provider is dangerous because: https://github.com/yetone/avante.nvim/issues/1048
  -- Of course, you can reduce the request frequency by increasing `suggestion.debounce`.
  auto_suggestions_provider = "claude",
  providers = {
      ---@type AvanteSupportedProvider
      claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-sonnet-4-5-20250929",
          disable_tools = true, -- disable tools; don't trust the LLM to do anything beyond responding with text
          timeout = 30000, -- Timeout in milliseconds
          context_window = 200000,
          extra_request_body = {
              temperature = 0.75,
              max_tokens = 64000,
          },
      },
  },
  dual_boost = {
    enabled = false,
  },
  behaviour = {
    auto_suggestions = false, -- Experimental stage
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
    minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
    enable_token_counting = true, -- Whether to enable token counting. Default to true.
    auto_add_current_file = true, -- Whether to automatically add the current file when opening a new chat. Default to true.
    auto_approve_tool_permissions = false, -- Default: auto-approve all tools (no prompts)
    -- Examples:
    -- auto_approve_tool_permissions = false,                -- Show permission prompts for all tools
    -- auto_approve_tool_permissions = {"bash", "replace_in_file"}, -- Auto-approve specific tools only
  },
  prompt_logger = { -- logs prompts to disk (timestamped, for replay/debugging)
    enabled = false, -- toggle logging entirely
    log_dir = vim.fn.stdpath("cache") .. "/avante_prompts", -- directory where logs are saved
    fortune_cookie_on_success = false, -- shows a random fortune after each logged prompt (requires `fortune` installed)
    next_prompt = {
      normal = "<C-n>", -- load the next (newer) prompt log in normal mode
      insert = "<C-n>",
    },
    prev_prompt = {
      normal = "<C-p>", -- load the previous (older) prompt log in normal mode
      insert = "<C-p>",
    },
  },
  web_search_engine = {
      provider = nil, -- disable web search tool use
  },
  mappings = {
      --- @class AvanteConflictMappings
      diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
      },
      suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
      },
      jump = {
          next = "]]",
          prev = "[[",
      },
      submit = {
          normal = "<C-g><C-g>",
          insert = "<C-g><C-g>",
      },
      cancel = {
          normal = { "<C-c>", "<Esc>", "q" },
          insert = { "<C-c>" },
      },
      sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          retry_user_request = "r",
          edit_user_request = "e",
          switch_windows = "<Nop>", -- Default <Tab>
          reverse_switch_windows = "<Nop>", -- Default <S-Tab>
          remove_file = "d",
          add_file = "@",
          close = "<Nop>",
          -- close = { "<Esc>", "q" },
          close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
      },
      ask = "<leader>ua",
      new_ask = "<leader>un",
      zen_mode = "<leader>uz",
      edit = "<leader>ue",
      refresh = "<leader>ur",
      focus = "<leader>uf",
      stop = "<leader>uS",
      toggle = {
          default = "<leader>ut",
          debug = "<leader>ud",
          selection = "<leader>uC",
          suggestion = "<leader>us",
          repomap = "<leader>uR",
      },
      files = {
          add_current = "<leader>uc", -- Add current buffer to selected files
          add_all_buffers = "<Nop>", -- Add all buffer files to selected files
      },
      select_model = "<leader>u?",
      select_history = "<leader>uh", -- Select history command
  },
  --- Allows selecting code or other data in a buffer and ask LLM questions about it or
  --- to perform edits/transformations.
  --- @class AvanteSelectionConfig
  --- @field enabled boolean
  --- @field hint_display "delayed" | "immediate" | "none" When to show key map hints.
  selection = {
      enabled = false,
      hint_display = "delayed",
  },
  windows = {
    ---@type "right" | "left" | "top" | "bottom"
    position = "right", -- the position of the sidebar
    wrap = true, -- similar to vim.o.wrap
    width = 30, -- default % based on available width
    sidebar_header = {
      enabled = true, -- true, false to enable/disable the header
      align = "center", -- left, center, right for title
      rounded = true,
    },
    input = {
      prefix = "> ",
      height = 8, -- Height of the input window in vertical layout
    },
    edit = {
      border = "rounded",
      start_insert = true, -- Start insert mode when opening the edit window
    },
    ask = {
      floating = false, -- Open the 'AvanteAsk' prompt in a floating window
      start_insert = false, -- Start insert mode when opening the ask window
      border = "rounded",
      ---@type "ours" | "theirs"
      focus_on_apply = "ours", -- which diff to focus after applying
    },
  },
  highlights = {
    ---@type AvanteConflictHighlights
    diff = {
      current = "DiffText",
      incoming = "DiffAdd",
    },
  },
  --- @class AvanteConflictUserConfig
  diff = {
    autojump = true,
    ---@type string | fun(): any
    list_opener = "copen",
    --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
    --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
    --- Disable by setting to -1.
    override_timeoutlen = 500,
  },
  suggestion = {
    debounce = 600,
    throttle = 600,
  },
})
