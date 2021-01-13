function git_commit_branch
  if test (count $argv) = 0
    echo "Please provide a commit message"
    return 1
  else
    set msg "$argv"
  end
  git commit -am $argv
end
