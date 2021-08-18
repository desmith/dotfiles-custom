# status --is-interactive; and source (pyenv init -|psub)
#source (pyenv init - | psub)

fish_vi_key_bindings

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

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

if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

direnv hook fish | source

