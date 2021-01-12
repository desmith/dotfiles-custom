function update_all --description 'Update OS X'
	sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update;
end
