set -gx PROJECT_PATHS ~/code ~/projects /var/www

for path in ~/.local/bin ~/bin ~/bin/certs ~/bin/mysql ~/bin/perl ~/bin/pgres ~/bin/php ~/bin/py ~/bin/ruby ~/gocode/bin /usr/local/mysql/bin /usr/local/bin ;

    #echo "added $path to PATH..."
    set -agx PATH $path;

end

#set -agx PATH /usr/local/opt/python/libexec/bin:$PATH
