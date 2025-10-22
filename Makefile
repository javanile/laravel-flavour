

test: build
	@composer dump-autoload
	@./vendor/bin/pest

push:
	@git add .
	@git commit -am "publish" || true
	@git push

build:
	@bash contrib/build.sh

publish: build push
	@bash contrib/publish.sh