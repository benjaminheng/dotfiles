function g
    git $argv
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
function open
    xdg-open $argv
end
function ccopy
    wl-copy -n
end
function cpaste
    wl-paste
end
function arch-news
    open "https://archlinux.org/news/"
end
function calc
    qalc
end
function hl
    hledger $argv
end
function cdhl
    cd ~/syncthing/hledger
end
function feh
    command feh --scale-down $argv
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
