#
# Personal
abbr clk clock
# OS X
abbr ccache 'sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
abbr eject 'echo "Ejecting Disk..."; /usr/bin/drutil eject'

abbr spotoff 'sudo mdutil -a -i off'  # Disable Spotlight
abbr spoton 'sudo mdutil -a -i on'  # Enable Spotlight

abbr ssh 'set TERM "xterm-256color"; ssh'
abbr stopenv 'deactivate'
#abbr ssh 'env TERM=xterm-256color ssh'
# create ssh tunnel for accessing phpMyAdmin on un.iskcon.org
abbr ssh-tunnel-pma.un.iskcon.org 'echo "visit https://127.0.0.1:8888/phpmyadmin"; ssh -N -L 8888:127.0.0.1:443 -i IC-un.pem  bitnami@un.iskcon.org'

abbr sshconf 'subl ~/.ssh'

abbr pw 'ps -efl | sha256sum | base64 | head -c 32'
# apps
abbr da django-admin
abbr darebuild 'django-admin search_index --rebuild'
# abbr subl '/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
abbr pyenv-install 'curl https://pyenv.run | bash'

# aws
abbr awspg 'aws --profile adminuser-govardhana'
abbr awspi 'aws --profile adminuser-icg'
abbr awsync 'aws s3 sync --exclude "*.DS_Store*" ./'
abbr get_aws_acct 'aws sts get-caller-identity --query Account --output text'

# git
abbr g git
abbr gs 'git status'
abbr ga 'git add'
abbr gaa 'git add --all'
abbr gc 'git commit'
abbr gcm 'git_commit_branch'
abbr gclone 'git clone git@gitlab.com:devap/'
abbr gco 'git checkout'
abbr gp 'git push'
abbr gpom 'git push origin main'
abbr gpm 'git push origin main'
abbr gpo 'git push origin ' (git_current_branch)
abbr gpl 'git pull'
abbr gcl 'git clone'
abbr gf 'git fetch'
abbr gr 'git remote'
abbr gb 'git branch'
abbr gd 'git diff'
abbr gl 'git log'
abbr catgit 'cat ./.git/config'
abbr gitcat 'cat ./.git/config'

# tmux
abbr t 'tmux'
abbr tl 'tmux ls'
abbr ta 'tmux attach -t'
abbr tk 'tmux kill-session -t'

# docker
abbr docker-clean-all "docker stop (docker container ls -a -q); and docker system prune -a -f --volumes"
abbr whale:bomb "docker stop (docker container ls -a -q); and docker system prune -a -f --volumes"

# quick switch to dirs
abbr desk "cd ~/Desktop"
abbr down "cd ~/Downloads"
abbr dots 'cd ~/.dotfiles/'

# quick edits to dot files
abbr vie '$EDIT_CMD $DOTDIR/.config/fish/conf.d/01_exports.fish'
abbr vip '$EDIT_CMD $DOTDIR/.config/fish/conf.d/02_paths.fish'
abbr via '$EDIT_CMD $DOTDIR/.config/fish/conf.d/03_aliases.fish'
abbr funcs '$EDIT_CMD $DOTDIR/.config/fish/functions/'
abbr fconfig '$EDIT_CMD $DOTDIR/.config/fish/config.fish'
abbr omfconfig '$EDIT_CMD $DOTDIR/.config/fish/conf.d/omf.fish'
abbr vimrc '$EDIT_CMD $DOTDIR/.config/nvim/init.vim'
abbr vrc '$EDIT_CMD $DOTDIR/.vimrc'
abbr vissh '$EDIT_CMD ~/.ssh'

# vim
abbr v nvim
abbr vi nvim
abbr vim nvim

#
# System/General
#

# fatfingers
abbr ecoh echo
abbr grpe grep
# ripgrep ignores hiddden files by default
abbr rga 'rg -uuu'

#abbr h 'history'
#abbr x 'exit'
#abbr p "pwd"
#abbr c 'clear'

# cd
abbr .. 'cd ..'  # up one
abbr .... 'cd ../..'  # up two
abbr ...... 'cd ../../..'  # up three
abbr .4 'cd ../../../..'  # up four
abbr .5 'cd ../../../../..'  # up five
abbr cdf 'cd $FISHDIR'
abbr fdir 'cd $FISHDIR'

abbr l 'exa -l'
abbr la 'exa -la'
abbr latr 'exa -la -sold'
abbr ls 'exa '
#abbr l 'ls -la'
#abbr latr 'ls -latr'
abbr cls clear
abbr clr clear
abbr cp 'cp -iv'
abbr cpr 'cp -Riv'  # recursive
abbr chx 'chmod +x'  # make it executable
abbr chR 'chmod -R'  # recursive
abbr duh 'du -h'  # list disk usage for all files in ./
abbr dush 'du -sh'  # list total disk usage of ./
abbr less "less -MNi" # file info/position, line #'s, smart case
abbr lns "ln -s"  # symlink in 2 less characters
abbr md 'mkdir -pv'  # auto nesting
abbr mv 'mv -iv'
abbr rm 'rm -i'
abbr rmrf 'rm -rfi'  # as if bricking your machine wasn't easy enough
abbr rmrfp 'rm -rfp'  # you could say that again
abbr tailf 'tail -f'
abbr tf 'tail -f'

# archives
abbr tgz 'tar -xvzf' # extract .tar.gz
abbr tbz 'tar -xvjf' # extract .tar.bz2

# system aliases()
abbr zzz 'sudo shutdown -s now'
abbr reboot 'sudo shutdown -r now'
abbr off 'sudo shutdown -h now'

# copy current path to system clipboard
abbr cwd "pwd | eval $CLIPBOARD"

abbr tr "tree -C -L 1" # show a quick tree of files
abbr tra 'tree -C -a -L 1' # also list hidden files (think "list all")

# https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be

#
# Extra
#

# find and tail all logs in ./
abbr tails "tail -F (find . -type f -not -name '*.tar' -not -name '*.gz' -not -name '*.zip' -not -path '*.git*' -not -path '*.svn*' -not -path '*node_modules*' | grep -e '/log/' -e '/logs/' -e '\.log')"

# misc
abbr lmk "say 'Process complete.'" # pin to the tail of long commands
abbr m "math" # quick calculations in the terminal
abbr hs 'hugo server --disableFastRender --watch -v'

#
# Network Info
#

abbr localip "ipconfig getifaddr en1"
abbr ips "ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ and print $1'"
abbr myip "curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"
abbr sniff "sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
abbr httpdump "sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

abbr nameservers 'host -t ns'

#
# extra
#

# URL encode/decode
abbr urlencode 'python -c "import urllib.parse, sys; print(urllib.parse.quote_plus(sys.argv[1]))"'
abbr urldecode 'python -c "import urllib.parse, sys; print(urllib.parse.unquote_plus(sys.argv[1]))"'

# todo.txt
abbr to 'todo.sh'

# git-flow
abbr gfi 'git flow init'
abbr gff 'git flow feature'
abbr gffs 'git flow feature start'
abbr gffs 'git flow feature finish'
abbr gfh 'git flow hotfix'
abbr gfhs 'git flow hotfix finish'


# homebrew
abbr bi 'brew install'
abbr bri 'brew install'
abbr get 'brew install'
abbr bs 'brew search'
abbr bud 'brew update'
abbr bug 'brew upgrade'
abbr bd 'brew doctor'
abbr bl 'brew list'
abbr bu 'brew uninstall'

# homebrew cask
abbr bci 'brew cask install'
abbr bcs 'brew cask search'
abbr bcia 'brew cask install --appdir "/Applications"'
abbr getapp 'brew cask install --appdir "/Applications"'

# postgresql
abbr pgstart 'pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
abbr pgstop 'pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# npm & the gang
abbr npr 'npm run'
abbr yar 'yarn run'

# grunt
abbr gr 'grunt'
abbr grus 'grunt serve'
abbr grub 'grunt build'

# pianobar (pandora cli)
abbr pandora pianobar
abbr pb 'pianobar 2>&1 | grep -v API'

# youtube-dl | http://rg3.github.io/youtube-dl/
abbr ytdl 'youtube-dl'
abbr ytmp3 'youtube-dl --extract-audio --audio-format mp3'
abbr ytaudio 'youtube-dl --extract-audio'

# exiftool
abbr exiftime "exiftool -time:all -s" # show all time attrs
abbr exifval "exiftool -s -s -s" # just print value(s)

switch (uname)
	case Linux
		abbr pbcopy 'xclip -selection clipboard'
		abbr pbpaste 'xclip -selection clipboard -o'
end
