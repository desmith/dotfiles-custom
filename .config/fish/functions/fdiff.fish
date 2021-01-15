# inspired by
# https://github.com/junegunn/fzf/wiki/examples#changing-directory

function fdiff --description "Pipe git diff through fzf"
  set preview "git diff $argv --color=always -- {-1}"
  git diff $argv --name-only | fzf -m --ansi --preview $preview
end
