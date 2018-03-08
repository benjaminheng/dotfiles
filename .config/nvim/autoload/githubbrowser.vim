" Location: autoload/github-browse.vim
" Author: Benjamin Heng

" Get username and repo name
function! githubbrowser#get_repo_info() abort
    let line = substitute(system('git remote -v | grep origin | head -1'), '\n\+$', '', '')
    " let ssh_re_fmt = 'git@github\.com[:/]\([^/]\+\)/\([^/]\+\)\s'
    let re = 'git@github\.com[:/]\([^/]\+\)/\([^/]\+\)\.git'
    let m = matchlist(line, re)
    let matched = []
    if !empty(m)
        return {
        \   'user': m[1],
        \   'repo_name': substitute(m[2], '\.git$', '', ''),
        \}
    endif
    return {}
endfunction

function! githubbrowser#get_hash() abort
    let hash = system('git rev-parse HEAD')
    return substitute(hash, '\n\+$', '', '')
endfunction

function! githubbrowser#get_path() abort
    let rel_path = @%
    let root = substitute(system('git rev-parse --show-prefix'), '\n\+$', '', '')
    if !root
        let root = '/'
    endif
    return root . rel_path
endfunction

function! githubbrowser#build_url() abort
    let repo_info = githubbrowser#get_repo_info()
    if !has_key(repo_info, 'user')
        echo 'Cannot get repo info'
        return ''
    endif
    let url = 'https://github.com/' . repo_info.user . '/' . repo_info.repo_name . '/blob/' . githubbrowser#get_hash() . githubbrowser#get_path()
    return url
endfunction

function! githubbrowser#open_url(url) abort
    if a:url != ""
        silent exec "!open '".a:url."'"
    endif
endfunction

function! githubbrowser#show_in_github_with_range() abort range
    let url = githubbrowser#build_url()
    if a:firstline == a:lastline
        let url .= '\#L' . a:firstline
    else
        let url .= '\#L' . a:firstline . '-L' . a:lastline
    endif
    call githubbrowser#open_url(url)
endfunction

function! githubbrowser#show_in_github() abort
    let url = githubbrowser#build_url()
    call githubbrowser#open_url(url)
endfunction
