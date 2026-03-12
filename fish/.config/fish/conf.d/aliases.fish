function g
    git $argv
end
function j
    jj $argv
end
function k
    kubectl $argv
end
function ls
    command ls -G --color=auto $argv
end
function vim
    nvim $argv
end
function view
    nvim -R $argv
end
function scratchpad
    cd $HOME/dev/tmp/scratchpad
end
function epoch
    date -r
end
function jqless
    jq -C | less -R
end
function ccopy
    pbcopy
end
function cpaste
    pbpaste
end
function current_branch
    set -l ref (git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if test $status -ne 0
        return
    end
    echo $ref
end
function venv-activate
    . ~/dev/python-virtualenvs/$argv[1]/bin/activate.fish
end
function tnew
    tmux new-session -A -s $argv[1];
end
function units
    gunits
end
function jqvim
    jq | vim -c 'set ft=json' -c 'set foldmethod=syntax' -
end
function pkb
    kb --config ~/.config/kb/private-kb.config.toml
end
function allhosts
    cat $HOME/dev/scratchpad/allhosts | grep -Ev '^#|^$'
end
