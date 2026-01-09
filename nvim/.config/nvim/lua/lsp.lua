-- Disable diagnostics, since we use ale for linting errors
local function setup_diagnostics()
    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = '● ',
                [vim.diagnostic.severity.WARN] = '● ',
                [vim.diagnostic.severity.INFO] = '● ',
            },
        },
    })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
    -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    --     vim.lsp.diagnostic.on_publish_diagnostics,
    --     {
    --         virtual_text = false,
    --         signs = true,
    --         update_in_insert = false,
    --         underline = true,
    --     }
    -- )
end
setup_diagnostics()

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

-- LSP setup
vim.lsp.config("pyright", {
    on_attach = on_attach_generic,
    flags = {
      debounce_text_changes = 150,
    }
})
vim.lsp.config("gopls", {
    on_attach = on_attach_generic,
    flags = {
      debounce_text_changes = 150,
    }
})
vim.lsp.enable("pyright")
vim.lsp.enable("gopls")

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
