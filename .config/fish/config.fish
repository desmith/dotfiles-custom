set -g -x fish_greeting '
	Hare Krishna Hare Krishna Krishna Hare Hare
	Hare Rama Hare Rama Rama Rama Hare Hare
'

if status is-interactive

  #load omf
  source $OMF_PATH/init.fish

  #omf: load virtualfish with plugins
  #eval (python -m virtualfish auto_activation compat_aliases global_requirements projects)

  fish_vi_key_bindings

  #starship init fish | source
  tmux ls

end
