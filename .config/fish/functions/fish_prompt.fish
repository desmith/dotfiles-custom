### Valid colors include:
# black, red, green, yellow, blue, magenta, cyan, white
# brblack, brred, brgreen, bryellow, brblue, brmagenta, brcyan, brwhite
#
# The following options are available:
#
# -b, --background COLOR sets the background color.
# -c, --print-colors prints a list of the 16 named colors.
# -o, --bold sets bold mode.
# -d, --dim sets dim mode.
# -i, --italics sets italics mode.
# -r, --reverse sets reverse mode.
# -u, --underline sets underlined mode.
###

set -g __fish_prompt_grey A3A3A3
set -g __fish_git_prompt_char_cleanstate "✔"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_stateseparator \U0020
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""
set -g __fish_git_prompt_color $__fish_prompt_grey
set -g __fish_git_prompt_color_branch $__fish_prompt_grey
set -g __fish_git_prompt_color_cleanstate green
set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_untrackedfiles $__fish_prompt_grey

set -g __fish_git_prompt_hide_untrackedfiles 1
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showcolorhints 1
set -g __fish_git_prompt_showupstream "informative"



set -g _color_orange fc0
set -g _color_purple 62A
set -g _color_error red
set -g _color_git_branch magenta
set -g _color_user green
set -g _color_path cyan
set -g _color_host yellow
set -g _color_datetime green
set -g _color_java blue
set -g _color_python green
set -g _color_ruby red
set -g _color_xcode $_color_purple

function __user_host

    #set -l content
    if [ (id -u) = "0" ];
        set_color --bold $_color_error
    else
        set_color $_color_user
    end
    echo -n (whoami)
    set_color white
    echo -n '@'
    set_color $_color_host
    echo -n (hostname|cut -d . -f 1)
    set_color normal

end

function __current_path

    # echo -n (set_color cyan)":"(pwd)(set_color normal)

    # If current dir is not writable display it in red
    if not [ -w (pwd) ]
        set_color $_color_error
    else
        set_color $_color_path
    end

    echo -n '   🐳' (pwd)
    set_color normal
end

function _git_branch_name
    echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function __git_status
    if [ (_git_branch_name) ]
        set -l git_branch (_git_branch_name)

        if [ (_git_is_dirty) ]
            set git_info '<'$git_branch"*"'>'
        else
            set git_info '<'$git_branch'>'
        end

        set_color $_color_git_branch
        echo ' '$git_info
        set_color normal
    else
        echo ''
    end
end

function __java_version
    if test -f pom.xml \
            -o -f build.sbt \
            -o -f build.gradle \
            -o -f build.sc \
            -o (count *.java) -gt 0
        set img (imgcat $FISHDIR/img/java.png)
        set java_version (java -version 2>&1 | grep -Eo '"(.*?)"' | head -1 | cut -d '"' -f2)
        set_color $_color_java
        echo '    '$img $java_version
        set_color normal
    end
end

function __python_version
    if test (count *.py) -gt 0; or test $VIRTUAL_ENV
        set img (imgcat $FISHDIR/img/python.png)
        set python_version (python --version 2>&1 | grep -o "\d*\.\d*\.\d*")
        set_color $_color_python
        echo '   '$img $python_version
        #echo '    🐍 '$python_version
        set_color normal
    end
end

function __ruby_version
    if test (count *.rb) -gt 0
        set img (imgcat $FISHDIR/img/ruby.png)
        if type "rvm-prompt" > /dev/null 2>&1
            set ruby_version (rvm-prompt i v g)
        else if type "rbenv" > /dev/null 2>&1
            set ruby_version (rbenv version-name)
        else
            set ruby_version 'system'
        end
        set_color $_color_ruby
        echo '    ' $img $ruby_version
        set_color normal
    end
end

function __xcode_version
    if test (count *.xcodeproj) -gt 0 >/dev/null;  \
            or test (count *.swift) -gt 0 >/dev/null; \
            or test (count *.plist) -gt 0 >/dev/null; \
            or test (count *.h) -gt 0 >/dev/null; \
            or test (count *.m) -gt 0 >/dev/null
        set img (imgcat $FISHDIR/img/xcode.png)
        set xcode_version (xcodebuild -version)
        set_color $_color_xcode
        echo '   '$img $xcode_version
        #echo '    🐍 '$python_version
        set_color normal
    end
end

function __get_virtual_env
    set CONDA_DEFAULT_ENV $VIRTUAL_ENV
    if set -q VIRTUAL_ENV
        set_color -b blue white
        echo -n -s '(' (basename "$VIRTUAL_ENV") ')'
        set_color normal
    end
end

function fish_prompt --description 'Write out the main prompt'

    set_color white
    echo -n '╭─'
    set_color normal
    __user_host
    __git_status
    __python_version
    __ruby_version
    __xcode_version
    __java_version
    __current_path
    echo -e ''
    set_color white
    echo -n '    ╰─'
    __get_virtual_env
    set_color --bold white
    echo -n ' $ '
    set_color normal

    # error on last command...
    set -l last_status $status
    if not test $last_status -eq 0
        set_color $_color_error
    end

end

function fish_right_prompt --description 'Write out the right-side prompt'
    # set -l st $status
    set -l st (date)

    if [ $st != 0 ];
        set_color $_color_datetime
        echo ↵ $st
        set_color normal
    end
end
