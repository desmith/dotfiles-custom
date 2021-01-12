[[ "$-" != *i* ]] && return
# The above line will protect the functionality of rsync
# by only continuing if the shell is in interactive mode
# In particular, rsync fails if things are echo-ed to the terminal

export me=`basename "${BASH_SOURCE}"`¬
export CONFIG_DEBUG=1

if [ "${CONFIG_DEBUG}" -gt 0 ]; then
    echo "${me}: loading ~/.profile... "
fi

# Get global env vars
if [ -f /etc/profile ]; then
    source /etc/profile
fi

for file in ~/.{path,prompt,exports,aliases,functions,completions,extra,aliases}; do
    if [ "${CONFIG_DEBUG}" -gt 0 ]; then
        echo "${me}: loading ${file}..."
    fi;
    [ -r "$file" ] && [ -f "$file" ] && source "${file}";
done;
unset file;

for dir in ~/bin ~/bin/perl ~/bin/py ~/bin/mac ~/bin/osx /usr/local/bin /usr/local/apache2/bin /usr/local/share/python ; do
    echo ${PATH} | grep -q -s "$dir"
    if [ $? -eq 1 ] ; then
        echo "$dir not in path - adding..."
        PATH=$dir:${PATH}
    fi
done

#screen -list
