#
# Makefile for low-latency-preview
#
usage:
	@echo "make [edit|build|run]"

edit e:
	vi main.go

build b:
	go build -o llserver

run r:
	@echo "make (run) [1:server|2:client|3:viewer]"

1 run-server rs:
	./llserver ./www 2>logs/server.log &

2 run-client rc:
	./launchEncoderTestPattern.sh

3 run-viewer rv:
	xdg-open http://127.0.0.1:8080/ldashplay/1234/manifest.mpd

kill-all ka:
	killall llserver
	killall ffmpeg
#-----------------------------------------------------------------------------------------
git g:
	@echo "make (git) [update|login|tag|status]"

git-update gu:
	git add .gitignore go.* *.md Makefile handlers/ utils/ shell/
	#git commit -m "initial commit"
	#git remote remove go.mod sse.go
	#git commit -m "add examples"
	git commit -m "update contents"
	git push

git-login gl:
	git config --global user.email "sikang99@gmail.com"
	git config --global user.name "Stoney Kang"
	git config --global push.default matching
	#git config --global push.default simple
	git config credential.helper store

git-tag gt:
	git tag v0.0.3
	git push --tags

git-status gs:
	git status
	git log --oneline -5
#-----------------------------------------------------------------------------------------

