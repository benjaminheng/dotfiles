function g
    git $argv
end
function j
    jj $argv
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
