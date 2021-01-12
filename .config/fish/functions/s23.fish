function s23 -d "syncing files to S3"
		set curdir (pwd)
	  cd ~/.dotfiles
	  ./sync_2_s3
	  cd $curdir
end
