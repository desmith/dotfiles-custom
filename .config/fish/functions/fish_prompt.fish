# Theme based on Bira theme from oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/bira.zsh-theme
# Some code stolen from oh-my-fish clearance theme: https://github.com/bpinto/oh-my-fish/blob/master/themes/clearance/

function __user_host
  set -l content
  if [ (id -u) = "0" ];
    echo -n (set_color --bold red)
  else
    echo -n (set_color green)
  end
  echo -n $USER(set_color white)@(set_color yellow)(hostname|cut -d . -f 1)(set_color normal)
end

function __current_path
  # echo -n (set_color cyan)":"(pwd)(set_color normal)
  echo -n (set_color white)"    🐳 "(set_color cyan)(pwd)(set_color normal)
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
      echo (set_color yellow) $git_info (set_color normal)
  else
    echo ''
  end
end

function __ruby_version
  if type "rvm-prompt" > /dev/null 2>&1
    set ruby_version (rvm-prompt i v g)
  else if type "rbenv" > /dev/null 2>&1
    set ruby_version (rbenv version-name)
  else
    set ruby_version "system"
  end

  echo -n (set_color red) ‹$ruby_version› (set_color normal)
end

function __get_virtual_env
  if set -q VIRTUAL_ENV
      echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal)
  end
end

function fish_prompt
  echo -n (set_color white)"╭─"(set_color normal)
  __user_host
  __git_status
  __current_path
#  __ruby_version
  echo -e ''
  echo -n (set_color white)"    ╰─"
  __get_virtual_env
  echo (set_color --bold white)" \$ "(set_color normal)

end

function fish_right_prompt
  set -l st $status

  if [ $st != 0 ];
    echo (set_color red) ↵ $st(set_color normal)
  end
end
