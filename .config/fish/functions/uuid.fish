function uuid --description 'Quickly generate a UUID'
	python -c 'import sys,uuid; sys.stdout.write(uuid.uuid4().hex)' | pbcopy && pbpaste && echo
end
