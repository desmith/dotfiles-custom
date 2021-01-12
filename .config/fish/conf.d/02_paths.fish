set -gx PROJECT_PATHS ~/code /var/www

for path in ~/bin ~/bin/certs ~/bin/mysql ~/bin/perl ~/bin/pgres ~/bin/php ~/bin/py ~/bin/ruby ~/gocode/bin /usr/local/mysql/bin;

  set -agx PATH $path;

end
