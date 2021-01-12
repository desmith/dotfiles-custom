function pcompile --description 'pip-compile creates requirements.txt from requirements.in'
	pip-compile --generate-hashes $argv
end

#		--quiet \
#	  --output-file=requirements.txt
#	  requirements.in
