if status is-interactive
    eval (ssh-agent -c) > /dev/null
    ssh-add ~/.ssh/id_ed25519_github > /dev/null 2>&1
end

set -g -x GOPATH "$HOME/dev/go"
set -g -x GOBIN "$GOPATH/bin"
set PATH $PATH ~/bin
set PATH $PATH ~/dev/private-dotfiles/bin
set PATH $GOBIN $PATH
set VISUAL "nvim"
set EDITOR "$VISUAL"
set GIT_EDITOR "$VISUAL"
set -g -x GOPRIVATE github.com/benjaminheng
set -x LEDGER_FILE "/home/ben/syncthing/hledger/finances.journal"

# Set prompt
function fish_prompt
    echo (set_color green)(prompt_pwd)(set_color normal) (fish_vcs_prompt) '> '
end

# Enable fzf keybindings
function fish_user_key_bindings
	fzf_key_bindings
end
