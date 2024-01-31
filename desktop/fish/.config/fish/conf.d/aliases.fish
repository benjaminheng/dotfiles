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
    xclip -i -selection clipboard
end
function cpaste
    xclip -o -selection clipboard
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
