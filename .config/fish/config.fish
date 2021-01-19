direnv hook fish | source

#omf: load virtualfish with plugins
#eval (python -m virtualfish auto_activation compat_aliases global_requirements projects)

# status --is-interactive; and source (pyenv init -|psub)
#source (goenv init - | psub)
#source (pyenv init - | psub)
#source (rbenv init - | psub)
#nvm use node > /dev/null 2>&1

fish_vi_key_bindings

#test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

#echo "config.fish done"

#set -g fish_user_paths "/usr/local/opt/node@12/bin" $fish_user_paths
#set -g fish_user_paths "/usr/local/opt/node@14/bin" $fish_user_paths

switch (uname)

	case Darwin
		set -g -x fish_greeting '
			Hare Krishna Hare Krishna Krishna Hare Hare
			Hare Rama Hare Rama Rama Rama Hare Hare!
		'

		if test -d (brew --prefix)"/share/fish/completions"
			set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
		end
		if test -d (brew --prefix)"/share/fish/vendor_completions.d"
			set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
		end

end
