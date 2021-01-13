function git_current_branch
  set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
  echo $git_branch
end
