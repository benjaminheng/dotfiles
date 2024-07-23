local nvim_lsp = require('lspconfig')

-- Disable diagnostics, since we use ale for linting errors
-- Would like to use this because it's more performant for Go, I'm not a fan of
-- its behavior. Don't like virtual text. I want messages to show up on hover
-- in the command line instead.
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- Initialize LSP keybinds
local init_lsp_keybindings = function(bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

-- LSP on_attach handler for generic cases.
local on_attach_generic = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  init_lsp_keybindings(bufnr)
  print('Attached to LSP')
end

-- LSP on_attach handler for Go. Differences from generic:
-- 1. No omnifunc handler. We use vim-go's one instead, because it has fuzzy matching.
local on_attach_go = function(client, bufnr)
  init_lsp_keybindings(bufnr)
  print('Attached to LSP')
end

-- LSP setup
nvim_lsp.pyright.setup{
    on_attach = on_attach_generic,
    flags = {
      debounce_text_changes = 150,
    }
}
nvim_lsp.gopls.setup{
    on_attach = on_attach_go,
    flags = {
      debounce_text_changes = 150,
    }
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "templ" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
