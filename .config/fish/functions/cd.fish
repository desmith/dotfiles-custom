function cd -d 'change directory and list contents'
    set dest ~
    if test (count $argv) -eq 1; set dest $argv; end
    builtin cd "$dest"
    #ls -laF
end
