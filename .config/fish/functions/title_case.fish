function title_case -a string
  set -l matches (string match -r -a '\b[a-z]' $string)

  for match in $matches
    set -l upper (echo $match | tr a-z A-Z)
    set string (echo (string replace -r '\b[a-z]' $upper $string))
  end

  echo $string
end
