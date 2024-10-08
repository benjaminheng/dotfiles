local gpConf = {
    -- For customization, refer to Install > Configuration in the Documentation/Readme
    providers = {
        openai = {},
        azure = {},
        copilot = {},
        ollama = {},
        lmstudio = {},
        googleai = {},
        pplx = {},
        anthropic = {
			endpoint = "https://api.anthropic.com/v1/messages",
            secret = {
                "cat",
                "/home/ben/.config/ben01/a",
            },
        },
    },
    -- if true, explicitly confirm deletion of a chat file
    chat_confirm_delete = false,
    -- if true, finished ChatResponder won't move the cursor to the end of the buffer
    chat_free_cursor = true,
}
require("gp").setup(gpConf)

local function keymapOptions(desc)
    return {
        noremap = true,
        silent = true,
        nowait = true,
        desc = "GPT prompt " .. desc,
    }
end
vim.keymap.set("n", "<Leader>cc", "<cmd>GpChatNew<cr>", keymapOptions("New Chat vsplit"))
vim.keymap.set("v", "<Leader>cc", ":<C-u>'<,'>GpChatNew vsplit<cr>", keymapOptions("Visual Chat New vsplit"))
vim.keymap.set("v", "<Leader>cp", ":<C-u>'<,'>GpChatPaste<cr>", keymapOptions("Visual Chat Paste"))
vim.keymap.set("n", "<Leader>cr", "<cmd>GpRewrite<cr>", keymapOptions("Inline Rewrite"))
vim.keymap.set("v", "<Leader>cr", ":<C-u>'<,'>GpRewrite<cr>", keymapOptions("Visual Rewrite"))
vim.keymap.set("n", "<Leader>cf", "<cmd>GpChatFinder<cr>", keymapOptions("Chat finder"))
