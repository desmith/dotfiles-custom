# Defined in /var/folders/5m/3wx0k88n2tqfqs5bcvq52rkh0000gp/T//fish.MwsXsC/s43.fish @ line 1
function s43 -d "sync .dotfiles from s3"
	set curdir (pwd)
  cd ~/.dotfiles
  ./sync_from_s3
  cd $curdir
end
