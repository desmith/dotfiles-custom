#!/usr/bin/env zsh

me=${(%):-%N}
if [ "${CONFIG_DEBUG}" -gt 0 ]; then
  echo "loading $me"
fi

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

#get current zsh theme
function get_current_theme() { echo $RANDOM_THEME }
function zsh_theme() { echo $RANDOM_THEME }

# Simple calculator
function calc() {
    local result="";
    result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')";
    #                       └─ default (when `--mathlib` is used) is 20
    #
    if [[ "$result" == *.* ]]; then
        # improve the output for decimal numbers
        printf "$result" |
        sed -e 's/^\./0./'        `# add "0" for cases like ".5"` \
            -e 's/^-\./-0./'      `# add "0" for cases like "-.5"`\
            -e 's/0*$//;s/\.$//';  # remove trailing zeros
    else
        printf "$result";
    fi;
    printf "\n";
}

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@";
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
    local tmpFile="${@%/}.tar";
    tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

    size=$(
        stat -f"%z" "${tmpFile}" 2> /dev/null; # OS X `stat`
        stat -c"%s" "${tmpFile}" 2> /dev/null # GNU `stat`
    );

    local cmd="";
    if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
        # the .tar file is smaller than 50 MB and Zopfli is available; use it
        cmd="zopfli";
    else
        if hash pigz 2> /dev/null; then
            cmd="pigz";
        else
            cmd="gzip";
        fi;
    fi;

    echo "Compressing .tar using \`${cmd}\`…";
    "${cmd}" -v "${tmpFile}" || return 1;
    [ -f "${tmpFile}" ] && rm "${tmpFile}";
    echo "${tmpFile}.gz created successfully.";
}

# Determine size of a file or total size of a directory
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh;
    else
        local arg=-sh;
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@";
    else
        du $arg .[^.]* *;
    fi;
}

# Use Git’s colored diff when available
hash git &>/dev/null;
if [ $? -eq 0 ]; then
    function diff() {
        git diff --no-index --color-words "$@";
    }
fi;

# Create a data URL from a file
function dataurl() {
    local mimeType=$(file -b --mime-type "$1");
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8";
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Create a git.io short URL
function gitio() {
    if [ -z "${1}" -o -z "${2}" ]; then
        echo "Usage: \`gitio slug url\`";
        return 1;
    fi;
    curl -i http://git.io/ -F "url=${2}" -F "code=${1}";
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
    local port="${1:-8000}";
    sleep 1 && open "http://localhost:${port}/" &
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver() {
    local port="${1:-4000}";
    local ip=$(ipconfig getifaddr en1);
    sleep 1 && open "http://${ip}:${port}/" &
    php -S "${ip}:${port}";
}

# Compare original and gzipped file size
function gz() {
    local origsize=$(wc -c < "$1");
    local gzipsize=$(gzip -c "$1" | wc -c);
    local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
    printf "orig: %d bytes\n" "$origsize";
    printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
    if [ -t 0 ]; then # argument
        python -mjson.tool <<< "$*" | pygmentize -l javascript;
    else # pipe
        python -mjson.tool | pygmentize -l javascript;
    fi;
}

# Run `dig` and display the most useful info
function digga() {
    dig +nocmd "$1" any +multiline +noall +answer;
}

# UTF-8-encode a string of Unicode symbols
function escape() {
    printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u);
    # print a newline unless we’re piping the output to another program
    if [ -t 1 ]; then
        echo ""; # newline
    fi;
}

# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
    perl -e "binmode(STDOUT, ':utf8'); print \"$@\"";
    # print a newline unless we’re piping the output to another program
    if [ -t 1 ]; then
        echo ""; # newline
    fi;
}

# Get a character’s Unicode code point
function codepoint() {
    perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))";
    # print a newline unless we’re piping the output to another program
    if [ -t 1 ]; then
        echo ""; # newline
    fi;
}

# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
function getcertnames() {
    if [ -z "${1}" ]; then
        echo "ERROR: No domain specified.";
        return 1;
    fi;

    local domain="${1}";
    echo "Testing ${domain}…";
    echo ""; # newline

    local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
        | openssl s_client -connect "${domain}:443" 2>&1);

    if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
        local certText=$(echo "${tmp}" \
            | openssl x509 -text -certopt "no_header, no_serial, no_version, \
            no_signame, no_validity, no_issuer, no_pubkey, no_sigdump, no_aux");
            echo "Common Name:";
            echo ""; # newline
            echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//";
            echo ""; # newline
            echo "Subject Alternative Name(s):";
            echo ""; # newline
            echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
                | sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
            return 0;
    else
        echo "ERROR: Certificate not found.";
        return 1;
    fi;
}

# `s` with no arguments opens the current directory in Sublime Text, otherwise
# opens the given location
function s() {
    if [ $# -eq 0 ]; then
        subl .;
    else
        subl "$@";
    fi;
}

# `a` with no arguments opens the current directory in Atom Editor, otherwise
# opens the given location
function a() {
    if [ $# -eq 0 ]; then
        atom .;
    else
        atom "$@";
    fi;
}

# `v` with no arguments opens the current directory in Vim, otherwise opens the
# given location
function v() {
    if [ $# -eq 0 ]; then
        vim .;
    else
        vim "$@";
    fi;
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
    if [ $# -eq 0 ]; then
        open .;
    else
        open "$@";
    fi;
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
    tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}



# alternate version of title in terminal/iTerm window
#function settitle() { echo -n "]0;$@"; }
#function cd() { command cd "$@"; settitle `pwd -P`; }
#settitle `pwd`

# Run Django management commands
# Assumes project directory is symlinked as `main` in the root of the virtualenv
function dmc(){
    cd main
    python ./manage.py $1
    cd ..
}
# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}

# pip bash completion end

# work on virtualenv
# this is defined in virtualenvwrapper.sh
# thus not needed here...
#function workon(){
#  echo "entering workon()"
#  cd "$VIRTUALENV_PROJECTS/$1"
#  source bin/activate
#}

# Automatically activate Git projects' virtual environments based on the
# directory name of the project. Virtual environment name can be overridden
# by placing a .venv file in the project root with a virtualenv name in it
function workon_git {
    # Check that this is a Git repo
    GIT_DIR=`git rev-parse --git-dir 2> /dev/null`
    if [ $? == 0 ]; then
        # Find the repo root and check for virtualenv name override
        GIT_DIR=`\cd $GIT_DIR; pwd`
        PROJECT_ROOT=`dirname "$GIT_DIR"`
        ENV_NAME=`basename "$PROJECT_ROOT"`
        if [ -f "$PROJECT_ROOT/.venv" ]; then
            ENV_NAME=`cat "$PROJECT_ROOT/.venv"`
        fi
        # Activate the environment only if it is not already active
        if [ "$VIRTUAL_ENV" != "$WORKON_HOME/$ENV_NAME" ]; then
            if [ -e "$WORKON_HOME/$ENV_NAME/bin/activate" ]; then
                workon "$ENV_NAME" && export CD_VIRTUAL_ENV="$ENV_NAME"
            fi
        fi
    elif [ $CD_VIRTUAL_ENV ]; then
        # We've just left the repo, deactivate the environment
        # Note: this only happens if the virtualenv was activated automatically
        deactivate && unset CD_VIRTUAL_ENV
    fi
}

function workon_cwd {
	if [ -f "./.venv" ]; then
		ENV_NAME=`cat .venv 2> /dev/null`
		if [ $? == 0 ]; then
			# Activate the environment only if it is not already active
			if [ "$VIRTUAL_ENV" != "$WORKON_HOME/$ENV_NAME" ]; then
				if [ -e "$WORKON_HOME/$ENV_NAME/bin/activate" ]; then
					workon "$ENV_NAME" && export CD_VIRTUAL_ENV="$ENV_NAME"
				fi
			fi
		elif [ $CD_VIRTUAL_ENV ]; then
			# We've just left the repo, deactivate the environment
			# Note: this only happens if the virtualenv was activated automatically
			deactivate && unset CD_VIRTUAL_ENV
		else
			echo "no virtual environment was active"
		fi
	fi
}

# New cd function that does the virtualenv magic for .git repos
function venv_cd {
    cd "$@" && workon_git
}

# New cd function that does the virtualenv magic for any directory
function venv_cwd {
    cd "$@" && workon_cwd
}

alias cdl="venv_cwd"
alias venv="venv_cwd"

function title {
	#echo -ne "\033]1;$@\007"
	echo -ne "\033]1;"$*"\007"
	echo -ne "\e]2;$PWD\a"
}

function get_set_hostname {
#	$title `hostname`
	title "$USER@$HOST"
}

# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text
function setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}
function stt_both  () { setTerminalText 0 $@; }
function stt_tab   () { setTerminalText 1 $@; }
function stt_title () { setTerminalText 2 $@; }

### set iterm tab
# oh-my-zsh only
#add-zsh-hook precmd get_set_hostname

### create vi-like insert/exec mode at prompt
function zle-keymap-select zle-line-init zle-line-finish {
  case $KEYMAP in
    vicmd)      print -n -- "\E]50;CursorShape=0\C-G";; # block cursor
    viins|main) print -n -- "\E]50;CursorShape=1\C-G";; # line cursor
  esac

  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select


# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et
