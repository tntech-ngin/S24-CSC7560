all: 
	npm run
	npm run build
	cp -r public/* docs
	cd docs; git add .;git commit -am 'update';git push origin master
