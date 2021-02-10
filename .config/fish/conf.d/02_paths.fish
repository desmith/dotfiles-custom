set -gx PROJECT_PATHS ~/code ~/projects /var/www

for newpath in /opt/homebrew/bin ~/.local/bin ~/bin ~/bin/certs ~/bin/mysql ~/bin/perl ~/bin/pgres ~/bin/php ~/bin/py ~/bin/ruby ~/gocode/bin /usr/local/mysql/bin /usr/local/bin ;

    contains -- $newpath $fish_user_paths
       or set -U fish_user_paths $fish_user_paths $newpath
    #set -agx PATH $newpath;

end

switch (uname)

    case Linux 
        for newpath in /home/ec2-user/.linuxbrew/bin /home/ec2-user/.linuxbrew/sbin ; 
	    contains -- $newpath $fish_user_paths 
	        or set -U fish_user_paths $fish_user_paths $newpath
        end

end
