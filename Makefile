

push:
	@git add .
	@git commit -am "publish" || true
	@git push

build:
	@bash contrib/build.sh

publish:
	@bash contrib/publish.sh