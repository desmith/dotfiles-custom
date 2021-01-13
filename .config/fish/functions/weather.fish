# inspired by
# https://github.com/junegunn/fzf/wiki/examples#changing-directory

function weather --description "Get the weather"
  if test (count $argv) -lt 1;
    set location Boyds
  else
    set location = $argv[1]
  end

  echo "Retrieving the weather for $location..."
  curl "http://wttr.in/$location"
end
