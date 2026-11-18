if status is-interactive
    eval (ssh-agent -c) > /dev/null
    ssh-add ~/.ssh/id_ed25519_github > /dev/null 2>&1
    ssh-add ~/.ssh/id_rsa_hbenjamin_com > /dev/null 2>&1
    ssh-add ~/.ssh/id_ed25519_digitalocean_1 > /dev/null 2>&1
end

set --global fish_key_bindings fish_default_key_bindings
set -g -x GOPATH "$HOME/dev/go"
set -g -x GOBIN "$GOPATH/bin"
set PATH $PATH ~/bin
set PATH $PATH ~/dev/private-dotfiles/bin
set PATH $GOBIN $PATH
set PATH $PATH ~/.npm-global/bin
set -gx VISUAL "nvim"
set -gx EDITOR "$VISUAL"
set -gx GIT_EDITOR "$VISUAL"
set -gx GOPRIVATE github.com/benjaminheng
set -x LEDGER_FILE "/home/ben/syncthing/hledger/finances.journal"

# AI related vars
set -gx CLAUDE_CODE_DISABLE_ALTERNATE_SCREEN 1
set -gx CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC "1" # for deepseek
set -gx ANTHROPIC_API_KEY $(cat ~/.config/ben01/a)
set -gx DEEPSEEK_API_KEY_FOR_PI_AGENT $(cat ~/.config/ben01/deepseek-pi-agent.key)
set -gx KAGI_API_KEY_FOR_PI_AGENT $(cat ~/.config/ben01/kagi-for-ben-desktop-pi-agent.key)

# Set prompt
function fish_prompt
    echo (set_color green)(prompt_pwd)(set_color normal) (fish_vcs_prompt) '> '
end

# Enable fzf keybindings
# function fish_user_key_bindings
# 	fzf_key_bindings
# end

# uv
fish_add_path "/home/ben/.local/bin"
