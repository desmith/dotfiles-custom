set -gx DOTDIR $HOME/.dotfiles
set -gx FISHDIR $DOTDIR/.config/fish

set -gx EDITOR (type -p nvim)
set -gx MANPATH "/usr/local/man:/usr/share/man/"

set -gx PAGER less
set -gx VISUAL $EDITOR
set -gx USERNAME $LOGNAME
set -gx LC_TMUX_SESSION_NAME $USERNAME

set -gx NVM_DIR "$HOME/.nvm"

set -gx CLICOLOR 1
set -gx LSCOLORS cxfxcxdxbxegedabagacad
set -gx LS_COLORS 'no=00:fi=00:di=01;35;40:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config

# Highlight section titles in manual pages
# set -gx LESS_TERMCAP_md "${yellow}";
set -gx TERM xterm

# Don’t clear the screen after quitting a manual page
set -gx MANPAGER "less -X";

set -gx DJANGO_COLORS dark

set -gx SSH_KEY_PATH "~/.ssh/id_rsa"
set -gx RSYNC_RSH ssh

set gpgagent (eval pgrep gpg-agent)
set -gx GPG_AGENT_INFO "~/.gnupg/S.gpg-agent:$gpgagent:1"

set -gx CHEATCOLORS true
set -gx CHEAT_CONFIG_PATH "$HOME/.dotfiles/.config/cheat/conf.yml"

# Git settings
set -gx GIT_MERGE_AUTOEDIT yes
set -gx GIT_PROMPT_THEME Default

### Python ###
set -gx PYTHONSTARTUP ~/.pythonrc.py
set -gx PYTHONPATH ".:$HOME/bin/py:$HOME/.pip:./.pip:$PYTHONPATH"

### Virtualenv
set -gx PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV true
set -gx VIRTUALFISH_COMPAT_ALIASES true
set -gx VIRTUALFISH_ACTIVATION_FILE .venv
set -gx VIRTUALFISH_HOME ~/.venvs
set -gx PROJECT_HOME ~/Dropbox/projects
#set -gx WORKON_HOME ~/.venvs
#set -gx PIP_REQUIRE_VIRTUALENV true
set -gx PIP_RESPECT_VIRTUALENV true
# export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

### AWS & ec2-api-tools ###
set -gx AWSDIAGNOSTIC_HOME ~/bin/aws-diagnostic-tools/bin
set -gx EC2_KEYPAIR WebServer # name only, not the file name
set -gx EC2_URL "https://ec2.us-east-1.amazonaws.com"
set -gx AWS_VAULT_BACKEND "file"

set -gx GOROOT /usr/local/go
set -gx GOPATH ~/gocode
set -gx ANSIBLE_VAULT_PASSWORD_FILE ~/.ansible-vault-pw.txt

# Compilation flags
set -gx ARCHFLAGS "-arch x86_64"

# Github
set -gx GITHUB_USERNAME desmith
set -gx GITLAB_USERNAME devap
set -gx GITLAB_API_ENDPOINT "https://gitlab.com/api/v3"
#set -gx GITLAB_API_PRIVATE_TOKEN

set -gx LESS '-F -g -i -M -R -S -w -X -z-4'

switch (uname)
	case Linux
	  set -gx JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/jre
	  set -gx EC2_HOME "/usr/local/ec2"
	  set -gx EDIT_CMD rsub
	  set -x HOMEBREW_PREFIX "$HOME/.linuxbrew"
	  set -x HOMEBREW_CELLAR "$HOMEBREW_PREFIX/Cellar"
	  set -x HOMEBREW_REPOSITORY "$HOMEBREW_PREFIX/Homebrew"
	  set -x MANPATH "$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}:"
	  set -x INFOPATH "$HOMEBREW_PREFIX/share/info:${INFOPATH:-}"

	case Darwin
		source ~/.env-tokens
		#set -gx HOMEBREW_GITHUB_API_TOKEN (moved into .env-tokens)
		set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications";
		set -gx	HOMEBREW_NO_AUTO_UPDATE 1
		set -gx BROWSER open
		set -gx EDIT_CMD code

        source ~/bin/pyenv_libs

	case FreeBSD NetBSD DragonFly
		echo FreeBSD NetBSD DragonFly

	case '*'
		echo Hi, stranger!
end
